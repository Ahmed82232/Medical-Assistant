import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/auth/login.dart';
import 'package:graduation_project/auth/sign.dart';
import 'package:graduation_project/modules/profile.dart';
import 'package:graduation_project/modules/refrences.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/shared/components/consistant.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/networks/local/cache_helper.dart';
import 'package:shimmer/shimmer.dart';
import '../generated/l10n.dart';
import '../shared/style/colors.dart';

Widget buildDrawer(context) => BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: Drawer(
            backgroundColor:
                SettingCubit.get(context).isDark ? mainDarkColor : Colors.white,
            elevation: 1,
            width: 250,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      color: SettingCubit.get(context).isDark
                          ? Color.fromARGB(186, 20, 20, 20)
                          : defaultColor,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: DrawerHeader(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: isArabic()
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: isArabic()
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            child: DayNightSwitcherIcon(
                              isDarkModeEnabled:
                                  CacheHelper.getData(key: 'isDark'),
                              onStateChanged: (isDarkModeEnabled) {
                                SettingCubit.get(context).changeMode();
                              },
                            ),
                          ),
                          ConditionalBuilder(
                            condition: state is! LoadingProfileUserDataState,
                            fallback: (context) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    color: Colors.white54,
                                    width: 100.0,
                                    height: 15.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white54,
                                    width: 150.0,
                                    height: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            builder: (context) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: isArabic()
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                AppCubit.get(context).authModel != null &&
                                        AppCubit.get(context).authModel!.data !=
                                            null &&
                                        token != null
                                    ? Text(
                                        AppCubit.get(context)
                                            .authModel!
                                            .data!
                                            .name!,
                                        style: TextStyle(
                                            shadows: [],
                                            color: Colors.white70,
                                            fontSize: 13),
                                      )
                                    : Text(''),
                                AppCubit.get(context).authModel != null &&
                                        AppCubit.get(context).authModel!.data !=
                                            null &&
                                        token != null
                                    ? Text(
                                        AppCubit.get(context)
                                            .authModel!
                                            .data!
                                            .email!,
                                        style: TextStyle(
                                            shadows: [],
                                            color: Colors.white70,
                                            fontSize: 13))
                                    : Text(''),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                    contantDrawer(context, onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "Home Page", (route) => false);
                    }, icon: Icons.home, text: S.of(context).HomeDraw),
                    if (token != null)
                      contantDrawer(context, onTap: () {
                        naviTo(context, Profile());
                      },
                          icon: Icons.person_pin,
                          text: S.of(context).ProfileDraw),
                    contantDrawer(context, onTap: () {
                      Navigator.pushNamed(context, "Settings");
                    }, icon: Icons.settings, text: S.of(context).SettingsDraw),
                    contantDrawer(context, onTap: () {
                      Navigator.pushNamed(context, 'About');
                    },
                        icon: Icons.info_outline,
                        text: S.of(context).About_usDraw),
                    contantDrawer(context, onTap: () {
                      naviTo(context, RefrencesScreen());
                    },
                        icon: Icons.data_array,
                        text: S.of(context).RefrenceDraw),
                    token != null
                        ? contantDrawer(context, onTap: () {
                            CacheHelper.removeData(key: 'token').then((value) {
                              print('Token Removed from cache');
                              print(isRememberMeFromShared);
                              naviTo(context, LoginPage());
                            });
                          },
                            icon: Icons.logout_outlined,
                            text: S.of(context).Log_outDraw)
                        : contantDrawer(context, onTap: () {
                            naviTo(context, SignUpPage());
                            CacheHelper.saveData(key: 'login', value: true);
                          },
                            icon: Icons.login_outlined,
                            text: S.of(context).RegisterDraw)
                    /*
  عشان عملت upgrade to flutter from 3.7.1 to 3.13.7 
  listTitle: فيها مشكله  (مش عارف ليه)
  */
                    // ListTile(
                    //   // title: Text('Home Page'),
                    // )
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pushNamedAndRemoveUntil(
                    //         context, "Home Page", (route) => false);
                    //   },
                    //   iconColor: Colors.cyan,
                    //   textColor: Colors.black,
                    //   title: Text(S.of(context).HomeDraw,
                    //       style: TextStyle(
                    //           fontSize: isArabic() ? 13 : 14,
                    //           shadows: [],
                    //           color: SettingCubit.get(context).isDark
                    //               ? Colors.white70
                    //               : Colors.black)),
                    //   leading: Icon(Icons.home),
                    // ),
                    // if (token != null)
                    //   ListTile(
                    //     onTap: () {
                    //       naviTo(context, Profile());
                    //     },
                    //     iconColor: Colors.cyan,
                    //     textColor: Colors.black,
                    //     title: Text(S.of(context).ProfileDraw,
                    //         style: TextStyle(
                    //             fontSize: isArabic() ? 13 : 14,
                    //             shadows: [],
                    //             color: SettingCubit.get(context).isDark
                    //                 ? Colors.white70
                    //                 : Colors.black)),
                    //     leading: Icon(Icons.person_pin),
                    //   ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, "Settings");
                    //   },
                    //   iconColor: Colors.cyan,
                    //   textColor: Colors.black,
                    //   title: Text(S.of(context).SettingsDraw,
                    //       style: TextStyle(
                    //           fontSize: isArabic() ? 13 : 14,
                    //           shadows: [],
                    //           color: SettingCubit.get(context).isDark
                    //               ? Colors.white70
                    //               : Colors.black)),
                    //   leading: Icon(Icons.settings),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'About');
                    //   },
                    //   iconColor: Colors.cyan,
                    //   textColor: Colors.black,
                    //   title: Text(S.of(context).About_usDraw,
                    //       style: TextStyle(
                    //           fontSize: isArabic() ? 13 : 14,
                    //           shadows: [],
                    //           color: SettingCubit.get(context).isDark
                    //               ? Colors.white70
                    //               : Colors.black)),
                    //   leading: Icon(Icons.info_outline),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     naviTo(context, RefrencesScreen());
                    //   },
                    //   iconColor: Colors.cyan,
                    //   textColor: Colors.black,
                    //   title: Text(S.of(context).RefrenceDraw,
                    //       style: TextStyle(
                    //           fontSize: isArabic() ? 13 : 14,
                    //           shadows: [],
                    //           color: SettingCubit.get(context).isDark
                    //               ? Colors.white70
                    //               : Colors.black)),
                    //   leading: Icon(Icons.data_array),
                    // ),
                    // token != null
                    //     ? ListTile(
                    //         onTap: () {
                    //           CacheHelper.removeData(key: 'token')
                    //               .then((value) {
                    //             print('Token Removed from cache');
                    //
                    //             print(isRememberMeFromShared);
                    //
                    //             naviTo(context, LoginPage());
                    //           });
                    //         },
                    //         iconColor: Colors.cyan,
                    //         textColor: Colors.black,
                    //         title: Text(S.of(context).Log_outDraw,
                    //             style: TextStyle(
                    //                 fontSize: isArabic() ? 13 : 14,
                    //                 shadows: [],
                    //                 color: SettingCubit.get(context).isDark
                    //                     ? Colors.white70
                    //                     : Colors.black)),
                    //         leading: Icon(Icons.logout_outlined),
                    //       )
                    //     : ListTile(
                    //         onTap: () {
                    //           naviTo(context, SignUpPage());
                    //           CacheHelper.saveData(key: 'login', value: true);
                    //           // CacheHelper.removeData(key: 'token').then((value) {
                    //
                    //           //   // print('Token Removed from cache');
                    //
                    //           // });
                    //         },
                    //         iconColor: Colors.cyan,
                    //         textColor: Colors.black,
                    //         title: Text(S.of(context).RegisterDraw,
                    //             style: TextStyle(
                    //                 fontSize: isArabic() ? 13 : 14,
                    //                 shadows: [],
                    //                 color: SettingCubit.get(context).isDark
                    //                     ? Colors.white70
                    //                     : Colors.black)),
                    //         leading: Icon(Icons.login_outlined),
                    //       ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).alert,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: defaultColor),
                              ),
                            ],
                          ),
                          titlePadding: EdgeInsets.only(top: 10),
                          content: Text(S.of(context).message_Of_CD),
                          contentPadding: EdgeInsets.all(10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(S.of(context).no)),
                                TextButton(
                                    onPressed: () {
                                      CacheHelper.clearData();

                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      S.of(context).yes,
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    textColor: Colors.black,
                    color: SettingCubit.get(context).isDark
                        ? Color.fromARGB(255, 94, 14, 8)
                        : Colors.red,
                    highlightColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      S.of(context).ClearButDraw,
                      style: TextStyle(
                          color: SettingCubit.get(context).isDark
                              ? Colors.white70
                              : Colors.white,
                          fontSize: isArabic() ? 13 : 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
