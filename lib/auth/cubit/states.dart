import 'package:graduation_project/model/model.dart';

abstract class AuthStates {}

class InitialAuthState extends AuthStates {}
class ToggleVisabilityPasswordState extends AuthStates{}
class LoadingLoginState extends AuthStates {}

class SuccesssLoginState extends AuthStates {
  final AuthModel? authModel;
  SuccesssLoginState(this.authModel);
}

class ErrorLoginState extends AuthStates {
  final String error;
  ErrorLoginState(this.error);
}

class LoadingSignState extends AuthStates {}

class SuccesssSignState extends AuthStates {
  final AuthModel? authModel;
  SuccesssSignState(this.authModel);
}

class ErrorSignState extends AuthStates {
  final String error;
  ErrorSignState(this.error);
}
