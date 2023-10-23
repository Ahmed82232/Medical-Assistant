import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/auth/cubit/states.dart';
import 'package:graduation_project/auth/remote_network/dio_helper_auth.dart';
import 'package:graduation_project/model/model.dart';
import 'package:image_picker/image_picker.dart';

import '../end_points.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialAuthState());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void toggleVisiabilityPassword() {
    isPassword = !isPassword;
    emit(ToggleVisabilityPasswordState());
  }

  AuthModel? authModel;
  void userSign({
    required String name,
    required String email,
    required String phone,
     Image? image,
    required String password,
  }) {
    emit(LoadingSignState());
    DioHelperAuth.postData(url: sign, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image
    }).then((value) {
      // print(value.data);
      authModel = AuthModel.fromJson(value.data);
      // print('${authModel!.data!.email!}');
      print('Sign Successful');
      emit(SuccesssSignState(authModel));
    }).catchError((error) {
      print('error in sign ${error.toString()}');
      emit(ErrorSignState(error));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());
    DioHelperAuth.postData(url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      // print(value.data);
      authModel = AuthModel.fromJson(value.data);
      print('Login Successful');
      emit(SuccesssLoginState(authModel));
    }).catchError((error) {
      print('error in login ${error.toString()}');
      emit(ErrorLoginState(error));
    });
  }

  File? image;
  var imagePicker = ImagePicker();
  void uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }
}
