// ignore_for_file: deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/detect/result_detect.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/web%20view/webview.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../generated/l10n.dart';
import '../style/colors.dart';

// Widget buildItemStyle({
//   double height = 240,
//   double width = 240,
//   required String nameDisease,
//   required String nameImage,
//   required VoidCallback ontap,
// }) =>
//     InkWell(
//       onTap: ontap,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       child: Container(
//         height: height,
//         width: width,
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(32)),
//             boxShadow: [
//               BoxShadow(
//                   color: Color.fromARGB(255, 183, 183, 183),
//                   blurRadius: 3,
//                   spreadRadius: 1,
//                   offset: Offset(-6, -3))
//             ]),
//         child: Column(children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.05),
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                     child: Image.asset(
//                       "assets/images/$nameImage",
//                       fit: BoxFit.cover,
//                       width: width,
//                       height: height - 50,
//                     )),
//               ],
//             ),
//           ),
//           Container(
//             width: width,
//             height: 50,
//             decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 21, 139, 172),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Column(
//                 children: [
//                   Text(
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.start,
//                     nameDisease,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20,
//                         inherit: false,
//                         color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );

Widget HomeStyleContiner(
  context, {
  double height = 230,
  double width = 230,
  required String nameDisease,
  required String nameImage,
  required VoidCallback ontap,
}) =>
    Bounceable(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        // height: height,
        // width: width,
        height: SettingCubit.get(context).textSize == 0
            ? height
            : SettingCubit.get(context).textSize > 0
                ? height + SettingCubit.get(context).textSize + 10
                : height + SettingCubit.get(context).textSize - 10,
        width: SettingCubit.get(context).textSize == 0
            ? width
            : SettingCubit.get(context).textSize > 0
                ? width + SettingCubit.get(context).textSize + 10
                : width + SettingCubit.get(context).textSize - 10,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 5,
          shadowColor:
              SettingCubit.get(context).isDark ? Colors.black54 : Colors.grey,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/images/$nameImage"),
                        fit: BoxFit.cover)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(isArabic() ? 5 : 10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(
                              SettingCubit.get(context).isDark ? 0.6 : 0.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        nameDisease,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20 + SettingCubit.get(context).textSize),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

Widget NameForEachSection(context,
        {required String nameSection,
        double textsize = 20,
        double padding = 10.0,
        Color col = Colors.black}) =>
    Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          Expanded(
            child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                nameSection,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: textsize + SettingCubit.get(context).textSize)),
          ),
        ],
      ),
    );

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> MassegeSnackBar(
        context,
        {required String textContent}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Color.fromARGB(230, 5, 107, 158),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.01,
          right: 100,
          left: 100,
        ),
        content: Container(
          height: 27,
          child: Row(
            children: [
              const CircleAvatar(
                minRadius: 15,
                backgroundColor: Colors.white,
                child: Text(
                  '!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 16, 0, 63),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                textContent,
                style: const TextStyle(fontSize: 19),
              ),
            ],
          ),
        ),
      ),
    );

Map<String, bool> showMoreMap = {};
Widget DataOfDiseases(context,
    {bool? isShowMore,
    String? img,
    String? nameTitleOfImg,
    String? contantOfImg,
    required VoidCallback onPress,
    required int index,
    required IconData? icon,
    required List<Map> nameDisease,
    required Color backgroundCol}) {
  return GestureDetector(
    onTap: onPress,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: backgroundCol, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.start,
                        "${nameDisease[index]['name']}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 19 + SettingCubit.get(context).textSize),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    isShowMore == true
                        ? Icons.arrow_circle_up
                        : Icons.arrow_circle_down,
                    size: 25 + SettingCubit.get(context).textSize,
                  ))
                ],
              ),
              if (isShowMore == true)
                Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 13, right: isArabic() ? 13 : 5),
                    child: Column(children: [
                      if (nameDisease[index]['subName'] != null)
                        Container(
                          alignment: isArabic()
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Text(
                            "${nameDisease[index]['subName']}",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 17 +
                                        SettingCubit.get(context).textSize),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (nameDisease[index]['definitions'] != null)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            alignment: isArabic()
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Text(
                              "${nameDisease[index]['definitions']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 15 +
                                          SettingCubit.get(context).textSize),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      img != null
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/$img'),
                                                fit: BoxFit.contain),
                                            Positioned(
                                              top: -5,
                                              right: -15,
                                              child: IconButton(
                                                  highlightColor:
                                                      Colors.transparent,
                                                  splashColor:
                                                      Colors.transparent,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                      Icons.fullscreen_exit,
                                                      size: 30)),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          Container(
                                            alignment: isArabic()
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Text(
                                              '$nameTitleOfImg',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text(
                                              '$contantOfImg',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color.fromARGB(
                                                      170, 0, 0, 0)),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image(
                                        image: AssetImage('assets/images/$img'),
                                        fit: BoxFit.contain),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '$nameTitleOfImg',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Icon(
                                          Icons.fullscreen,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container()
                    ])),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget builduttomUpload(
  context, {
  required int index,
}) =>
    Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: isArabic()
                  ? BorderRadius.only(topRight: Radius.circular(10))
                  : BorderRadius.only(topLeft: Radius.circular(10)),
              gradient: LinearGradient(
                  colors: isArabic()
                      ? SettingCubit.get(context).isDark
                          ? [
                              mainDarkColor,
                              Colors.grey[600]!,
                            ]
                          : [Colors.white, Colors.lightBlueAccent]
                      : SettingCubit.get(context).isDark
                          ? [
                              Colors.grey[600]!,
                              mainDarkColor,
                            ]
                          : [Colors.lightBlueAccent, Colors.white])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).diagnose,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18 + SettingCubit.get(context).textSize),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      print(index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detection(index: index),
                          ));
                    },
                    child: Text(
                      S.of(context).clickHere,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16 + SettingCubit.get(context).textSize),
                    )),
              )
            ],
          ),
        ),
      ],
    );

Widget buildItem(article, context) => GestureDetector(
      onTap: () {
        naviTo(context, WebViewsNews(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 5,
          shadowColor: SettingCubit.get(context).isDark
              ? Colors.white70.withOpacity(0.3)
              : Colors.grey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight:
                          isArabic() ? Radius.circular(5) : Radius.circular(0),
                      bottomRight:
                          isArabic() ? Radius.circular(5) : Radius.circular(0),
                      topLeft:
                          isArabic() ? Radius.circular(0) : Radius.circular(5),
                      bottomLeft:
                          isArabic() ? Radius.circular(0) : Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${article['urlToImage'] ?? (article['urlToImage'] = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdfhMEEdvPSR2zIdXgaxhGLRKhw3ft9ZRSnWUdKG8zYBQ1vpj9suG77t1JevKZ3YlpAwU&usqp=CAU')}"),
                        fit: SettingCubit.get(context).isDark
                            ? BoxFit.fill
                            : BoxFit.contain)),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "${article['title']}",
                          overflow: TextOverflow.ellipsis,
                          textAlign:
                              isArabic() ? TextAlign.right : TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 15 + SettingCubit.get(context).textSize,
                              color: Colors.black,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: isArabic()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(DateTime.parse(article['publishedAt'])),
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  13 + SettingCubit.get(context).textSize),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget buildArticle(list) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: ConditionalBuilder(
                condition:
                    !list[index]["title"].toString().contains("[Removed]"),
                builder: (context) => buildItem(list[index], context),
                fallback: (context) => SizedBox(),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 1,
            ),
        itemCount: list.length),
    fallback: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0).copyWith(top: 5),
              child: Shimmer.fromColors(
                direction:
                    isArabic() ? ShimmerDirection.rtl : ShimmerDirection.ltr,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  height: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white60,
                              height: 15,
                              width: 200,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.white60,
                              height: 15,
                              width: 150,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.white60,
                              height: 15,
                              width: 120,
                            ),
                            Spacer(),
                            Container(
                              alignment: isArabic()
                                  ? Alignment.bottomRight
                                  : Alignment.bottomLeft,
                              color: Colors.white70,
                              height: 15,
                              width: 100,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: 5)
    // Center(
    //   child: CircularProgressIndicator(),
    // ),
    );

Widget buildCustomBottun(context,
        {VoidCallback? onpress,
        Color? splashcol,
        Color col = const Color.fromARGB(255, 41, 83, 117),
        required String text,
        IconData? icon}) =>
    MaterialButton(
      textColor: Colors.white,
      color: col,
      splashColor: splashcol,
      hoverColor: Colors.transparent,
      minWidth: 25,
      elevation: 10,
      height: 50,
      animationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onpress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline4,
                // style: TextStyle(fontSize: 22),
              )),
          Icon(
            icon,
            size: 24,
          )
        ],
      ),
    );

Widget someInstructionBuilder(context) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset("assets/animations/Doctor with Notepad.json", width: 200),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameForEachSection(context,
                  nameSection: S.of(context).some,
                  padding: 0,
                  col: Color.fromARGB(255, 4, 89, 159),
                  textsize: 21),
              NameForEachSection(context,
                  nameSection: S.of(context).informations,
                  padding: 4,
                  col: Color.fromARGB(255, 4, 89, 159),
                  textsize: 20),
            ],
          ),
        ),
      ],
    );

Widget buildApoutUsItem(
        {required String text1, required String name, required String job}) =>
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(155, 1, 28, 51),
            radius: 30,
            child: Text(
              text1,
              style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Kalam',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(189, 255, 255, 255)),
              ),
              Text(
                job,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Alexandria',
                    color: Colors.grey[500]),
              )
            ],
          )
        ],
      ),
    );

Widget RefrenceStyle(context,
        {required String nameDisease,
        required String nameImage,
        required String url,
        required int delay}) =>
    DelayedDisplay(
      delay: Duration(milliseconds: delay),
      slidingCurve: Curves.ease,
      child: Bounceable(
        onTap: () {
          // final Uri _uri = Uri.parse(url);
          // launchUrl(_uri);
          naviTo(context, WebViewsNews(url));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          color:
              SettingCubit.get(context).isDark ? appBarDarkColor : Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: isArabic() ? 0 : 8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: isArabic()
                          ? BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))
                          : BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/$nameImage'))),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameDisease,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Kalam',
                            color: SettingCubit.get(context).isDark
                                ? Colors.white70
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Refrence from : ${url}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

void naviAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void naviTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget back(context) => IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back_ios));

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { Successful, Warning, Error }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.Successful:
      color = Colors.green;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
    default:
  }
  return color;
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

Widget contantDrawer(
  context, {
  required VoidCallback onTap,
  required IconData icon,
  required String text,
}) =>
    Container(
      margin: EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
          ),
          height: 50,
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.cyan,
              ),
              SizedBox(
                width: 30,
              ),
              Text(text,
                  style: TextStyle(
                      fontSize: isArabic() ? 13 : 14,
                      shadows: [],
                      fontWeight: FontWeight.bold,
                      color: SettingCubit.get(context).isDark
                          ? Colors.white70
                          : Colors.black)),
            ],
          ),
        ),
      ),
    );

Widget TextFF(context,
        {required String labelText,
        required TextEditingController controller,
        required String? Function(String?)? validate,
        required TextInputType keyboardType,
        Widget? prefixIcon,
        Widget? suffixIcon,
        VoidCallback? onTap,
        void Function(String)? onChanged,
        bool obscureText = false,
        bool? isEnabled,
        List<TextInputFormatter>? inputFormatters,
        double fontSize = 14,
        InputBorder? border}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      validator: validate,
      onChanged: onChanged,
      style: TextStyle(fontSize: 14),
      enabled: isEnabled,
      onTap: onTap,
      decoration: InputDecoration(
          border: border,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: fontSize),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
