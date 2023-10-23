import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/settings/states.dart';
import '../../shared/components/consistant.dart';
import '../../shared/networks/local/cache_helper.dart';

class SettingCubit extends Cubit<SettingsStates> {
  SettingCubit() : super(InitialSettingsState());
  static SettingCubit get(context) => BlocProvider.of(context);
  Future<void> changeLanguages(
    String codeLang,
  ) async {
    // Locale locale = Locale(codeLang);
    // S.load(locale);
    emit(LoadingSettingsState());
    await CacheHelper.saveData(key: 'changeLanguage', value: codeLang)
        .then((value) {
      print('change lang succ');
      emit(SuccessfulChangeLanguage(Locale(currentLanguage)));
    }).catchError((error) {
      emit(ErrorChangeLanguage(error));
    });
    // if (langu != null) {
    //   currentLanguage = langu!;
    //   emit(SuccessfulChangeLanguage(Locale(currentLanguage)));
    // } else {
    //   await CacheHelper.saveData(key: 'changeLanguage', value: codeLang)
    //       .then((value) {
    //     print('change lang succ');
    //     emit(SuccessfulChangeLanguage(Locale(currentLanguage)));
    //   }).catchError((error) {
    //     emit(ErrorChangeLanguage(error));
    //   });
    // }
  }

  void getSaveLang() {
    emit(LoadingSettingsState());
    CacheHelper.getData(key: 'changeLanguage');
    // print("change lang in shared ${changeLanguage!}");
    emit(SuccessfulChangeLanguage(Locale(langu!)));
  }

  bool isDark = true;
  // bool get currentMode => isDark;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      print("from shared isDark = $fromShared");
      emit(ChangeModeState(isDark));
    } else {
      isDark = !isDark;
      print("first isDark = $isDark");
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState(isDark));
      });
    }
  }

  double textSize = 0;
  void changeTextSized(double size) {
    textSize = size;
    emit(ChangeTextSizeState());
  }
}
