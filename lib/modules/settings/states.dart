import 'package:flutter/material.dart';

abstract class SettingsStates {}

class InitialSettingsState extends SettingsStates {}

class LoadingSettingsState extends SettingsStates {}

class SuccessfulChangeLanguage extends SettingsStates {
  final Locale locale;
  SuccessfulChangeLanguage(
    this.locale,
  );
}

class ErrorChangeLanguage extends SettingsStates {
  final String error;
  ErrorChangeLanguage(this.error);
}

class ChangeModeState extends SettingsStates {
  final bool isDark;

  ChangeModeState(this.isDark);
}

class ChangeTextSizeState extends SettingsStates {}
