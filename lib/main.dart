// ignore_for_file: deprecated_member_use
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/auth/cubit/cubit.dart';
import 'package:graduation_project/auth/login.dart';
import 'package:graduation_project/auth/remote_network/dio_helper_auth.dart';
import 'package:graduation_project/modules/OnBoarding/onBoarding.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/consistant.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/networks/local/cache_helper.dart';
import 'package:graduation_project/shared/networks/remote/dio_helper.dart';
import 'package:graduation_project/shared/routes/routes.dart';
import 'package:graduation_project/shared/style/theme.dart';
import 'auth/cubit/states.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'home layouts/home.dart';
import 'home layouts/splash_screen.dart';
import 'modules/settings/states.dart';
import 'shared/cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  DioHelperAuth.init();

  login = CacheHelper.getData(key: 'login');
  bool? skip = CacheHelper.getData(key: 'skip');
  bool? isLast = CacheHelper.getData(key: 'isLast');
  bool? isDark = CacheHelper.getData(key: 'isDark');
  isRememberMeFromShared = CacheHelper.getData(key: 'isRememberMe');
  token = CacheHelper.getData(key: 'token');
  langu = CacheHelper.getData(key: 'changeLanguage');

  Widget? widget;
  if (skip != null && skip == true) {
    widget = HomePage();
  } else if (isLast != null && isLast == true) {
    widget = HomePage();
  } else if (login != null && login == true) {
    widget = LoginPage();
    if (token != null) {
      widget = HomePage();
    } else {
      widget = LoginPage();
    }
  } else {
    widget = OnBoardingScreen();
  }
  print("changeLang =  $isChangeLanguage");
  print("Theme Mode =  $isDark");
  print('Login = $login, Skip = $skip, Language = $langu');

  runApp(MyApp(isDark, widget));
}

class MyApp extends StatefulWidget {
  MyApp(this.isDark, this.widget,
     
      {super.key});

  final Widget? widget;
  final bool? isDark;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..userProfile(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) =>
              SettingCubit()..changeMode(fromShared: widget.isDark),
        ),
      ],
      child: BlocConsumer<SettingCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition:
                state is! LoadingSettingsState || state is! LoadingLoginState,
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context) => MaterialApp(
              title: 'Gradiuation Project',

              debugShowCheckedModeBanner: false,
              // locale: langu != null ? Locale(langu!) : Locale(currentLanguage),

              locale: Locale(currentLanguage),
              // locale: isChangeLanguage == false && isChangeLanguage == null
              //     ? Locale(currentLanguage)
              //     : Locale(langu ?? currentLanguage),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('ar'),
              ],
              // localeResolutionCallback: (locale, supportedLocales) {
              //   for (var locales in supportedLocales) {
              //     if (locale != null &&
              //         locale.languageCode == locales.languageCode) {
              //       return locale;
              //     }
              //   }
              //   return supportedLocales.first;
              // },
              home: SplashScreen(
                widget.widget!,
              ),
              themeMode: SettingCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: lightMode,
              darkTheme: darkMode,
              routes: routes,
            ),
          );
        },
      ),
    );
  }
}
