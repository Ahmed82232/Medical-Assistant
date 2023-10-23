import 'package:flutter/material.dart';
import 'package:graduation_project/diseases/Brain_Tumor_Detection.dart';

import '../../diseases/Alzheimer_Detection.dart';
import '../../diseases/Bone_Fracture_Detection.dart';
import '../../diseases/Heart_Disease_Detection.dart';
import '../../diseases/Pneumonia_Detection.dart';

String currentLanguage = 'en';
Color colorAppBarDiseasesScreens =
    Color.fromRGBO(96, 125, 139, 1).withOpacity(0.9);
Color defaultColor = Color.fromARGB(255, 46, 96, 121);
String? token;
String? langu;
bool? isRememberMeFromShared;
bool? login;
String? emailFromShared;
String? passwordFromShared;
bool? isChangeLanguage;
bool isLoading = true;
bool? isDayModeChange;

List<Map> fractureDiseasesEn = [
  {
    'nameD': 'Bone Fracture',
    'image': '2103214.jpg',
    'navi': const BoneFractureDetection()
  },
];
List<Map> brainDiseasesEn = [
  {
    'nameD': 'Brain Tumor',
    'image': 'brain.jpg',
    'navi': const BrainTumorDetection()
  },
  {
    'nameD': 'Alzheimer',
    'image': 'alzheimer.png',
    'navi': const AlzheimerDetection()
  },
];

List<Map> heartDiseasesEn = [
  {
    'nameD': 'Heart Disease',
    'image': 'Heart.jpg',
    'navi': const HeartDiseaseDetection()
  },
  {
    'nameD': 'Pneumonia',
    'image': 'Pneumonia.jpg',
    'navi': const PneumoniaDetection()
  },
];

List<Map> fractureDiseasesAr = [
  {
    'nameD': "كسر العظام",
    'image': '2103214.jpg',
    'navi': const BoneFractureDetection()
  },
];
List<Map> brainDiseasesAr = [
  {
    'nameD': "ورم الدماغ",
    'image': 'brain.jpg',
    'navi': const BrainTumorDetection()
  },
  {
    'nameD': "الزهايمر",
    'image': 'alzheimer.png',
    'navi': const AlzheimerDetection()
  },
];

List<Map> heartDiseasesAr = [
  {
    'nameD': "مرض القلب",
    'image': 'Heart.jpg',
    'navi': const HeartDiseaseDetection()
  },
  {
    'nameD': "الالتهاب الرئوي",
    'image': 'Pneumonia.jpg',
    'navi': const PneumoniaDetection()
  },
];
