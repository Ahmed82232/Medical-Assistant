// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/components.dart';
import '../generated/l10n.dart';
import '../shared/components/consistant.dart';
import '../shared/style/colors.dart';

class RefrencesScreen extends StatefulWidget {
  const RefrencesScreen({super.key});

  @override
  State<RefrencesScreen> createState() => _RefrencesScreenState();
}

class _RefrencesScreenState extends State<RefrencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SettingCubit.get(context).isDark
            ? appBarDarkColor
            : Theme.of(context).bottomAppBarColor,
        title: Text(S.of(context).RefrenceDraw),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              RefrenceStyle(context,
                  delay: 30,
                  nameDisease: isArabic()
                      ? fractureDiseasesAr[0]['nameD']
                      : fractureDiseasesEn[0]['nameD'],
                  nameImage: isArabic()
                      ? fractureDiseasesAr[0]['image']
                      : fractureDiseasesEn[0]['image'],
                  url:
                      'https://www.pennmedicine.org/for-patients-and-visitors/patient-information/conditions-treated-a-to-z/bone-fractures'),
              SizedBox(
                height: 15,
              ),
              RefrenceStyle(context,
                  delay: 40,
                  nameDisease: isArabic()
                      ? brainDiseasesAr[0]['nameD']
                      : brainDiseasesEn[0]['nameD'],
                  nameImage: isArabic()
                      ? brainDiseasesAr[0]['image']
                      : brainDiseasesEn[0]['image'],
                  url:
                      'https://www.mayoclinic.org/diseases-conditions/brain-tumor/symptoms-causes/syc-20350084'),
              SizedBox(
                height: 15,
              ),
              RefrenceStyle(context,
                  delay: 50,
                  nameDisease: isArabic()
                      ? brainDiseasesAr[1]['nameD']
                      : brainDiseasesEn[1]['nameD'],
                  nameImage: isArabic()
                      ? brainDiseasesAr[1]['image']
                      : brainDiseasesEn[1]['image'],
                  url:
                      'https://www.mayoclinic.org/diseases-conditions/alzheimers-disease/symptoms-causes/syc-20350447'),
              SizedBox(
                height: 15,
              ),
              RefrenceStyle(context,
                  delay: 60,
                  nameDisease: isArabic()
                      ? heartDiseasesAr[0]['nameD']
                      : heartDiseasesEn[0]['nameD'],
                  nameImage: isArabic()
                      ? heartDiseasesAr[0]['image']
                      : heartDiseasesEn[0]['image'],
                  url:
                      'https://www.mayoclinic.org/diseases-conditions/heart-disease/symptoms-causes/syc-20353118'),
              SizedBox(
                height: 15,
              ),
              RefrenceStyle(context,
                  delay: 70,
                  nameDisease: isArabic()
                      ? heartDiseasesAr[1]['nameD']
                      : heartDiseasesEn[1]['nameD'],
                  nameImage: isArabic()
                      ? heartDiseasesAr[1]['image']
                      : heartDiseasesEn[1]['image'],
                  url:
                      'https://www.mayoclinic.org/diseases-conditions/pneumonia/symptoms-causes/syc-20354204'),
            ],
          ),
        ),
      ),
    );
  }
}
