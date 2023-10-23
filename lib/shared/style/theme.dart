// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/consistant.dart';

ThemeData lightMode = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    bottomAppBarColor: const Color.fromARGB(255, 46, 96, 121).withOpacity(0.9),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: defaultColor,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 14, color: Colors.black),
      headline4: TextStyle(fontSize: 22, color: Colors.white),
      caption: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 31, 31, 31),
          height: 1.2), // المحتوي التاني في مكونات الامراض
      headline2: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w500), //اسماء الخصائص فالامراض المحتوي الاول
      headline5:
          TextStyle(fontSize: 20, color: Colors.grey, fontFamily: 'Alexandria'),
      headline6: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: 'Kalam',
          fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 13, color: Colors.red),
      bodyText1: TextStyle(
          shadows: [
            const Shadow(
                color: Color.fromARGB(255, 197, 195, 195),
                offset: Offset(-3, 3),
                blurRadius: 3)
          ],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Alexandria'),
      //to name of main screen x-ray
      bodyText2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          inherit: false,
          color: Colors.white),
      //to text in setting
      // titleMedium: TextStyle(
      //     fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ));

ThemeData darkMode = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    bottomAppBarColor: Color.fromRGBO(39, 42, 43, 1).withOpacity(0.9),
    scaffoldBackgroundColor: HexColor('333739'),
    primaryColor: defaultColor,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 14, color: Colors.black),
      headline4: TextStyle(fontSize: 22, color: Colors.white),
      caption: TextStyle(
          fontSize: 15,
          color: Colors.white70,
          height: 1.2), // المحتوي التاني في مكونات الامراض
      headline2: TextStyle(
          fontSize: 17,
          color: Colors.white.withOpacity(0.78),
          fontWeight: FontWeight.w500), //اسماء الخصائص فالامراض المحتوي الاول
      headline5:
          TextStyle(fontSize: 20, color: Colors.grey, fontFamily: 'Alexandria'),
      headline6: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: 'Kalam',
          fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 13, color: Colors.red),
      //to name of sections
      bodyText1: TextStyle(
          shadows: [
            Shadow(color: Colors.black87, offset: Offset(-3, 3), blurRadius: 3)
          ],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
          fontFamily: 'Alexandria'),
      //to name of main screen x-ray
      bodyText2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          inherit: false,
          color: Colors.white70),
      //to text in setting
      // titleMedium: TextStyle(
      //     fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white10),
    ),
    cardColor: Colors.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(39, 42, 43, 1),
    ));
