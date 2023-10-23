// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `X_Ray`
  String get nameX_Ray {
    return Intl.message(
      'X_Ray',
      name: 'nameX_Ray',
      desc: '',
      args: [],
    );
  }

  /// `OCR`
  String get nameOCR {
    return Intl.message(
      'OCR',
      name: 'nameOCR',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Bone Fracture`
  String get Bone_name {
    return Intl.message(
      'Bone Fracture',
      name: 'Bone_name',
      desc: '',
      args: [],
    );
  }

  /// `Brain Tumor`
  String get Brain_name {
    return Intl.message(
      'Brain Tumor',
      name: 'Brain_name',
      desc: '',
      args: [],
    );
  }

  /// `Alzheimer`
  String get Alzheimer_name {
    return Intl.message(
      'Alzheimer',
      name: 'Alzheimer_name',
      desc: '',
      args: [],
    );
  }

  /// `Heart Disease`
  String get Heart_name {
    return Intl.message(
      'Heart Disease',
      name: 'Heart_name',
      desc: '',
      args: [],
    );
  }

  /// `Pneumonia`
  String get Pneumonia_name {
    return Intl.message(
      'Pneumonia',
      name: 'Pneumonia_name',
      desc: '',
      args: [],
    );
  }

  /// `Fractures`
  String get nameSec1 {
    return Intl.message(
      'Fractures',
      name: 'nameSec1',
      desc: '',
      args: [],
    );
  }

  /// `Brain Diseases`
  String get nameSec2 {
    return Intl.message(
      'Brain Diseases',
      name: 'nameSec2',
      desc: '',
      args: [],
    );
  }

  /// `Heart and Respiratory Diseases`
  String get nameSec3 {
    return Intl.message(
      'Heart and Respiratory Diseases',
      name: 'nameSec3',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get HomeDraw {
    return Intl.message(
      'Home',
      name: 'HomeDraw',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get ProfileDraw {
    return Intl.message(
      'Profile',
      name: 'ProfileDraw',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get SettingsDraw {
    return Intl.message(
      'Settings',
      name: 'SettingsDraw',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About_usDraw {
    return Intl.message(
      'About',
      name: 'About_usDraw',
      desc: '',
      args: [],
    );
  }

  /// `Refrences`
  String get RefrenceDraw {
    return Intl.message(
      'Refrences',
      name: 'RefrenceDraw',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Log_outDraw {
    return Intl.message(
      'Log out',
      name: 'Log_outDraw',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get RegisterDraw {
    return Intl.message(
      'Sign In',
      name: 'RegisterDraw',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Clear Data`
  String get ClearButDraw {
    return Intl.message(
      'Clear Data',
      name: 'ClearButDraw',
      desc: '',
      args: [],
    );
  }

  /// `Soon...`
  String get messageSoon1 {
    return Intl.message(
      'Soon...',
      name: 'messageSoon1',
      desc: '',
      args: [],
    );
  }

  /// `Sorry...,You must login first`
  String get messageSoon2 {
    return Intl.message(
      'Sorry...,You must login first',
      name: 'messageSoon2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our`
  String get splashText1 {
    return Intl.message(
      'Welcome to our',
      name: 'splashText1',
      desc: '',
      args: [],
    );
  }

  /// `Medical Assistant`
  String get splashText2 {
    return Intl.message(
      'Medical Assistant',
      name: 'splashText2',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get your_profile {
    return Intl.message(
      'Your Profile',
      name: 'your_profile',
      desc: '',
      args: [],
    );
  }

  /// `Some`
  String get some {
    return Intl.message(
      'Some',
      name: 'some',
      desc: '',
      args: [],
    );
  }

  /// `Informations`
  String get informations {
    return Intl.message(
      'Informations',
      name: 'informations',
      desc: '',
      args: [],
    );
  }

  /// `To diagnose your disease`
  String get diagnose {
    return Intl.message(
      'To diagnose your disease',
      name: 'diagnose',
      desc: '',
      args: [],
    );
  }

  /// `Click Here`
  String get clickHere {
    return Intl.message(
      'Click Here',
      name: 'clickHere',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Let's Started`
  String get start {
    return Intl.message(
      'Let\'s Started',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `In our application, we will help you diagnose some diseases, and in a large percentage the diagnosis will be correct `
  String get onBoardingT1 {
    return Intl.message(
      'In our application, we will help you diagnose some diseases, and in a large percentage the diagnosis will be correct ',
      name: 'onBoardingT1',
      desc: '',
      args: [],
    );
  }

  /// `But you should also consult a doctor, and we will also give you some information about this disease`
  String get onBoardingT2 {
    return Intl.message(
      'But you should also consult a doctor, and we will also give you some information about this disease',
      name: 'onBoardingT2',
      desc: '',
      args: [],
    );
  }

  /// `Pneumonia Detection`
  String get Pneumonia_Detection {
    return Intl.message(
      'Pneumonia Detection',
      name: 'Pneumonia_Detection',
      desc: '',
      args: [],
    );
  }

  /// `Heart Disease Detection`
  String get Heart_Disease_Detection {
    return Intl.message(
      'Heart Disease Detection',
      name: 'Heart_Disease_Detection',
      desc: '',
      args: [],
    );
  }

  /// `Brain Tumor Detection`
  String get Brain_Tumor_Detection {
    return Intl.message(
      'Brain Tumor Detection',
      name: 'Brain_Tumor_Detection',
      desc: '',
      args: [],
    );
  }

  /// `Bone Fracture Detection`
  String get Bone_Fracture_Detection {
    return Intl.message(
      'Bone Fracture Detection',
      name: 'Bone_Fracture_Detection',
      desc: '',
      args: [],
    );
  }

  /// `Alzheimer Detection`
  String get Alzheimer_Detection {
    return Intl.message(
      'Alzheimer Detection',
      name: 'Alzheimer_Detection',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Mode`
  String get change_theme {
    return Intl.message(
      'Change Mode',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete your data?`
  String get message_Of_CD {
    return Intl.message(
      'Are you sure to delete your data?',
      name: 'message_Of_CD',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to change language`
  String get message_Of_CL {
    return Intl.message(
      'Are you sure to change language',
      name: 'message_Of_CL',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Alert!`
  String get alert {
    return Intl.message(
      'Alert!',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light {
    return Intl.message(
      'Light Mode',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark {
    return Intl.message(
      'Dark Mode',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get create_ac {
    return Intl.message(
      'Create an Account',
      name: 'create_ac',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get emailAuth {
    return Intl.message(
      'Enter Your Email',
      name: 'emailAuth',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get nameAuth {
    return Intl.message(
      'Enter Your Name',
      name: 'nameAuth',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone`
  String get phoneAuth {
    return Intl.message(
      'Enter Your Phone',
      name: 'phoneAuth',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get passAuth {
    return Intl.message(
      'Enter Your Password',
      name: 'passAuth',
      desc: '',
      args: [],
    );
  }

  /// `Forget Your Password!`
  String get forget {
    return Intl.message(
      'Forget Your Password!',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get have_not_ac {
    return Intl.message(
      'Don\'t have an account?',
      name: 'have_not_ac',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_an_ac {
    return Intl.message(
      'Already have an account?',
      name: 'have_an_ac',
      desc: '',
      args: [],
    );
  }

  /// `Create one here.`
  String get RegNow {
    return Intl.message(
      'Create one here.',
      name: 'RegNow',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get LogNow {
    return Intl.message(
      'Login Now',
      name: 'LogNow',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With`
  String get log_with {
    return Intl.message(
      'Or Login With',
      name: 'log_with',
      desc: '',
      args: [],
    );
  }

  /// `Detection Lab`
  String get detect_lab {
    return Intl.message(
      'Detection Lab',
      name: 'detect_lab',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uImage {
    return Intl.message(
      'Upload Image',
      name: 'uImage',
      desc: '',
      args: [],
    );
  }

  /// `Image From`
  String get imgeFrom {
    return Intl.message(
      'Image From',
      name: 'imgeFrom',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get cam {
    return Intl.message(
      'Camera',
      name: 'cam',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gal {
    return Intl.message(
      'Gallery',
      name: 'gal',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone`
  String get yourPhone {
    return Intl.message(
      'Your Phone',
      name: 'yourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProf {
    return Intl.message(
      'Edit Profile',
      name: 'editProf',
      desc: '',
      args: [],
    );
  }

  /// `Save Edit`
  String get saveEdit {
    return Intl.message(
      'Save Edit',
      name: 'saveEdit',
      desc: '',
      args: [],
    );
  }

  /// `Click on the link if the page does not appear`
  String get titleWebView {
    return Intl.message(
      'Click on the link if the page does not appear',
      name: 'titleWebView',
      desc: '',
      args: [],
    );
  }

  /// `Change Text Size With`
  String get changeTextSize {
    return Intl.message(
      'Change Text Size With',
      name: 'changeTextSize',
      desc: '',
      args: [],
    );
  }

  /// `Change Text Size`
  String get changeTextSizeDis {
    return Intl.message(
      'Change Text Size',
      name: 'changeTextSizeDis',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
