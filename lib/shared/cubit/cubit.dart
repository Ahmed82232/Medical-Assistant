import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/components/consistant.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/networks/remote/dio_helper.dart';
import 'package:image_picker/image_picker.dart';
import '../../auth/end_points.dart';
import '../../auth/remote_network/dio_helper_auth.dart';
import '../../generated/l10n.dart';
import '../../home layouts/news.dart';
import '../../home layouts/ocr_home.dart';
import '../../home layouts/x-ray_home.dart';
import '../../modules/settings/settings.dart';
import '../../model/model.dart';
import '../components/components.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
//bottom nav
  List<Widget> screens = [
    const x_rayPage(),
    const ocrPage(),
    const News(),
    const Settings(),
  ];
  int bottomNavIndex = 0;
  void changeBottomNav(context, int index) {
    bottomNavIndex = index;
    if (bottomNavIndex == 1) {
      MassegeSnackBar(context, textContent: S.of(context).messageSoon1);
    } else if (bottomNavIndex == 2) {
    } else {}
    emit(ChangeNavBottomState());
  }

//in diseases screens
  IconData icon = Icons.arrow_circle_up;
  bool isShowMore = true;
  Map<int, bool> showMoreMap = {};
  int index = 0;
  void showMore({bool? more, int? index}) {
    isShowMore = more ?? !isShowMore;
    showMoreMap[index!] = isShowMore;
    icon = isShowMore ? Icons.arrow_circle_up : Icons.arrow_circle_down;
    emit(ShowMoreState());
    // print('more');
  }

//news api
  List<dynamic> health = [];
  Future getNewData() async {
    if (health.length == 0) {
      await DioHelper.getData(method: 'v2/top-headlines', query: {
        "country": currentLanguage == 'en' ? "us" : "eg",
        "category": "health",
        "apiKey": "79351858fcf1497ab570d6cca84ed016",
      }).then((value) {
        health = value.data['articles'];
        emit(GetNewsSuccessState());
        // print(health);
      }).catchError((error) {
        print("Error ${error.toString()}");
        emit(GetNewsErrorState(error.toString()));
        Future.delayed(Duration(seconds: 5), () {
          getNewData();
        });
      });
    }
    emit(GetNewsSuccessState());
  }

// for connection
  // bool showSadCloud = false;
  // String errorMess = '';
  // Future<ConnectivityResult> checkConnection()async {
  //   final  result = await Connectivity().checkConnectivity();

  // }

//image picker
  File? image;
  ImagePicker imagePicker = ImagePicker();
  Future uploadImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(UploadImageState());
    } else {
      image = File('assets/images/images.jpg');
    }
  }

  AuthModel? authModel;
  void userProfile() {
    emit(LoadingProfileUserDataState());
    DioHelperAuth.getData(url: profile, token: token).then((value) {
      // print(value.data);
      authModel = AuthModel.fromJson(value.data);
      // print('${authModel!.data!.email!}');
      // print('ProfileUserData Successful');
      emit(SuccesssProfileUserDataState(authModel));
    }).catchError((error) {
      print('error in ProfileUserData ${error.toString()}');
      emit(ErrorProfileUserDataState(error));
    });
  }

  void updateUserProfile({
    required String name,
    required String email,
    required String phone,
    String? image,
  }) {
    emit(LoadingUpdateProfileUserState());
    DioHelperAuth.putData(url: update_profile, token: token, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'image': image
    }).then((value) {
      // print(value.data);
      authModel = AuthModel.fromJson(value.data);
      // print('${authModel!.data!.email!}');
      // print('UserData Successful');
      emit(SuccesssUpdateProfileUserState(authModel));
    }).catchError((error) {
      print('error in UpdateProfileUser ${error.toString()}');
      emit(ErrorUpdateProfileUserState(error));
    });
  }

  // Future<void> changeLanguages(String codeLang) async {
  //   // Locale locale = Locale(codeLang);
  //   // S.load(locale);
  //   await CacheHelper.saveData(key: currentLanguage, value: codeLang);
  //   emit(ChangeLocalState(locale: Locale(currentLanguage)));
  // }

  // void getSaveLang() {
  //   final cacheLang = CacheHelper.getData(key: 'cacheLanguage');
  //   emit(ChangeLocalState(locale: Locale(cacheLang)));
  // }

  // void getSavedLanguage() {
  //   final cachedLanguageCode = CacheHelper.getCachedLanguage();
  //   emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
  // }

  // Future<void> changeLanguage(String languageCode) async {
  //   await CacheHelper.cacheLanguage(languageCode);
  //   emit(ChangeLocalState(locale: Locale(languageCode)));
  // }
}
