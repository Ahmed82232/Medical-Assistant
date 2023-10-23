import 'package:flutter/material.dart';

import '../../model/model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeNavBottomState extends AppStates {}
class ShowMoreState extends AppStates {}

class AppChangePageState extends AppStates {}

class AppBoneFratureState extends AppStates {}

class AppBrainToumorState extends AppStates {}

class AppAlzheimerState extends AppStates {}

class AppHeartState extends AppStates {}

class AppPheumoniaState extends AppStates {}

class GetNewsSuccessState extends AppStates {}

class GetNewsErrorState extends AppStates {
  final String error;
  GetNewsErrorState(this.error);
}

class SplashScreenState extends AppStates {}

class UploadImageState extends AppStates {}

class ConnectionFieldState extends AppStates {}

class GetNewsLoadingState extends AppStates {}

class LoadingProfileUserDataState extends AppStates {}

class SuccesssProfileUserDataState extends AppStates {
  final AuthModel? authModel;
  SuccesssProfileUserDataState(this.authModel);
}

class ErrorProfileUserDataState extends AppStates {
  final String error;
  ErrorProfileUserDataState(this.error);
}

class LoadingUpdateProfileUserState extends AppStates {}

class SuccesssUpdateProfileUserState extends AppStates {
  final AuthModel? authModel;
  SuccesssUpdateProfileUserState(this.authModel);
}

class ErrorUpdateProfileUserState extends AppStates {
  final String error;
  ErrorUpdateProfileUserState(this.error);
}

class ChangeLocalState extends AppStates {
  final Locale locale;
  ChangeLocalState({required this.locale});
}
