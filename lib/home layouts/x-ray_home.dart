import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/home%20layouts/load_screen.dart';
import 'package:graduation_project/modules/settings/states.dart';
import '../diseases/Bone_Fracture_Detection.dart';
import '../generated/l10n.dart';
import '../modules/settings/cubit.dart';
import '../shared/components/components.dart';
import '../shared/components/consistant.dart';

class x_rayPage extends StatefulWidget {
  const x_rayPage({super.key});

  @override
  State<x_rayPage> createState() => _x_rayPageState();
}

class _x_rayPageState extends State<x_rayPage> {
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoading = false;
      });
    });
    // _tabController = new TabController(
    //   length: 2,
    //   vsync: this,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingScreen()
        : BlocConsumer<SettingCubit, SettingsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            DelayedDisplay(
                              fadeIn: true,
                              delay: Duration(milliseconds: 30),
                              slidingCurve: Curves.linearToEaseOut,
                              child: NameForEachSection(context,
                                  nameSection: S.of(context).nameSec1,
                                  textsize: 23),
                            ),
                            Container(
                                // height: 250,
                                child: DelayedDisplay(
                              fadeIn: true,
                              delay: Duration(milliseconds: 40),
                              slidingCurve: Curves.linearToEaseOut,
                              child: HomeStyleContiner(context,
                                  nameDisease: S.of(context).Bone_name,
                                  nameImage: '2103214.jpg', ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BoneFractureDetection(),
                                    ));
                              }),
                            )),
                          ],
                        ),
                        // Divider(
                        //   height: 25,
                        //   thickness: 4,
                        // ),
                        Column(
                          children: [
                            DelayedDisplay(
                              fadeIn: true,
                              delay: Duration(milliseconds: 50),
                              slidingCurve: Curves.linearToEaseOut,
                              child: NameForEachSection(context,
                                  nameSection: S.of(context).nameSec2,
                                  textsize: 23),
                            ),
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) =>
                                      DelayedDisplay(
                                        fadeIn: true,
                                        delay: Duration(milliseconds: 60),
                                        slidingCurve: Curves.linearToEaseOut,
                                        child: HomeStyleContiner(context,
                                            nameDisease: isArabic()
                                                ? '${brainDiseasesAr[index]['nameD']}'
                                                : '${brainDiseasesEn[index]['nameD']}',
                                            nameImage: isArabic()
                                                ? '${brainDiseasesAr[index]['image']}'
                                                : '${brainDiseasesEn[index]['image']}',
                                            ontap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => isArabic()
                                                    ? brainDiseasesAr[index]
                                                        ['navi']
                                                    : brainDiseasesEn[index]
                                                        ['navi'],
                                              ));
                                        }),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 5),
                                  itemCount: isArabic()
                                      ? brainDiseasesAr.length
                                      : brainDiseasesEn.length),
                            ),
                          ],
                        ),
                        // Divider(
                        //   height: 25,
                        //   thickness: 4,
                        // ),
                        Column(
                          children: [
                            DelayedDisplay(
                              fadeIn: true,
                              delay: Duration(milliseconds: 70),
                              slidingCurve: Curves.linearToEaseOut,
                              child: NameForEachSection(context,
                                  nameSection: S.of(context).nameSec3,
                                  textsize: 23),
                            ),
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) =>
                                      DelayedDisplay(
                                        fadeIn: true,
                                        delay: Duration(milliseconds: 80),
                                        slidingCurve: Curves.easeIn,
                                        child: HomeStyleContiner(context,
                                            nameDisease: isArabic()
                                                ? '${heartDiseasesAr[index]['nameD']}'
                                                : '${heartDiseasesEn[index]['nameD']}',
                                            nameImage: isArabic()
                                                ? '${heartDiseasesAr[index]['image']}'
                                                : '${heartDiseasesEn[index]['image']}',
                                            ontap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => isArabic()
                                                    ? heartDiseasesAr[index]
                                                        ['navi']
                                                    : heartDiseasesEn[index]
                                                        ['navi'],
                                              ));
                                        }),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 5),
                                  itemCount: isArabic()
                                      ? heartDiseasesAr.length
                                      : heartDiseasesEn.length),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.06,
                        // )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }
}
