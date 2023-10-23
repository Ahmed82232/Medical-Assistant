import 'package:flutter/material.dart';
import 'package:graduation_project/auth/login.dart';
import 'package:graduation_project/home%20layouts/home.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/shared/networks/local/cache_helper.dart';
import 'package:graduation_project/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../generated/l10n.dart';
import '../../model/languages.dart';
import '../../shared/components/consistant.dart';

class OnBoarding {
  String? image;
  String? text1;
  // String? text2;
  OnBoarding({
    this.image,
    this.text1,
    // this.text2,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoarding> onBoardingEn = [
    OnBoarding(
      image: 'assets/images/on1-rmb.png',
      text1:
          'In our application, we will help you diagnose some diseases,and by a large percentage, the diagnosis will be correct',
      // text2: 'and by a large percentage, the diagnosis will be correct'
    ),
    OnBoarding(
      image: 'assets/images/on2.png',
      text1:
          'but you must also consult a doctor,and we will also give you some instructions about this disease',
      // text2:
      //     'and we will also give you some instructions about this disease'
    ),
  ];

  List<OnBoarding> onBoardingar = [
    OnBoarding(
      image: 'assets/images/on1-rmb.png',
      text1:
          'في تطبيقنا سنساعدك على تشخيص بعض الأمراض، وبنسبة كبيرة سيكون التشخيص صحيحا، ',
      // text2: 'and by a large percentage, the diagnosis will be correct'
    ),
    OnBoarding(
      image: 'assets/images/on2.png',
      text1:
          "لكن عليك أيضاً استشارة الطبيب، وسنقدم لك أيضاً بعض المعلومات حول هذا المرض",
      // text2:
      //     'and we will also give you some instructions about this disease'
    ),
  ];

  var onBoardController = PageController();

  bool isSkip = false;
  bool isLast = false;
  bool isFirst = true;
  bool? login;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        isSkip = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          SettingCubit.get(context).isDark ? mainDarkColor : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                isSkip
                    ? Row(
                        children: [
                          Align(
                            alignment: isArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: TextButton(
                              style: ButtonStyle(
                                  splashFactory: InkRipple.splashFactory),
                              child: Text(
                                S.of(context).skip,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 17, color: Colors.blue),
                              ),
                              onPressed: () {
                                CacheHelper.saveData(key: 'skip', value: true)
                                    .then((value) {
                                  // print(value);

                                  naviAndFinish(context, HomePage());
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : Container(),
                if (isFirst)
                  Align(
                    alignment: isArabic()
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: DropdownButton(
                      // hint: Text(S.of(context).change_language),
                      value: currentLanguage,
                      dropdownColor: SettingCubit.get(context).isDark
                          ? Colors.grey[600]
                          : Colors.white,
                      items: Languages.listLanguages()
                          .map((e) => DropdownMenuItem(
                              value: e.languagCode,
                              child: Row(
                                children: [
                                  Text(e.flag!),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    e.name!,
                                    style: TextStyle(
                                        color: SettingCubit.get(context).isDark
                                            ? Colors.white60
                                            : Colors.black),
                                  ),
                                ],
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          currentLanguage = value!;
                          // print(currentLanguage);
                        });
                        SettingCubit.get(context).changeLanguages(value!);
                        CacheHelper.saveData(key: 'lang', value: value);
                        // currentLanguage =
                        //     '${SettingCubit.get(context).changeLanguages(value)}';
                        print(value);
                      },
                    ),
                  )
              ],
            ),
            Expanded(
                flex: 15,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    if (value == onBoardingEn.length - 1) {
                      setState(() {
                        isLast = true;
                        isFirst = false;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                        isFirst = true;
                      });
                    }
                  },
                  itemCount: onBoardingEn.length,
                  itemBuilder: (context, index) => buildOnBoarding(
                      isArabic() ? onBoardingar[index] : onBoardingEn[index],
                      context),
                  controller: onBoardController,
                )),
            Expanded(
              child: SmoothPageIndicator(
                  effect: WormEffect(
                    dotHeight: 10,
                    activeDotColor: Colors.blueAccent,
                  ),
                  controller: onBoardController,
                  count: onBoardingEn.length),
            ),
            SizedBox(
              height: 5,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (isLast) {
                          CacheHelper.saveData(key: 'isLast', value: true)
                              .then((value) {
                            naviAndFinish(context, HomePage());
                          });
                        }
                        onBoardController.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.elasticIn);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: isLast
                          ? MediaQuery.of(context).size.width * 0.4
                          : MediaQuery.of(context).size.width * .35,
                      height: 50,
                      child: Text(
                        isLast ? S.of(context).start : S.of(context).next,
                        style: TextStyle(
                            color:
                                isLast ? Colors.red : Colors.lightBlue.shade800,
                            fontSize: 20),
                      ),
                      color: Colors.white70,
                    ),
                  ],
                ),
                if (isLast)
                  Align(
                    alignment: isArabic()
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: MaterialButton(
                      onPressed: () {
                        if (isLast) {
                          CacheHelper.saveData(key: 'login', value: true)
                              .then((value) {
                            login = value;
                            print(login);

                            naviAndFinish(context, LoginPage());
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: MediaQuery.of(context).size.width * .35,
                      height: 50,
                      child: Text(
                        S.of(context).login,
                        style: TextStyle(
                            color: Colors.lightBlue.shade800, fontSize: 20),
                      ),
                      color: Colors.white70,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildOnBoarding(OnBoarding model, context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 400, child: Image.asset(model.image!)),
        Row(
          children: [
            Expanded(
              child: Text('${model.text1!}',
                  textAlign: isArabic() ? TextAlign.center : TextAlign.center,
                  style: TextStyle(
                      fontSize: isArabic() ? 22 : 25,
                      fontFamily: isArabic() ? 'NotoKufiArabic' : 'Kalam',
                      fontWeight: FontWeight.bold,
                      color: SettingCubit.get(context).isDark
                          ? Colors.grey[400]
                          : Colors.black)),
            ),
          ],
        )
      ],
    );
