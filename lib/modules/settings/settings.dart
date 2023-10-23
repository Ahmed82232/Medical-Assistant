import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import 'package:graduation_project/modules/settings/states.dart';
import '../../generated/l10n.dart';
import '../../model/languages.dart';
import '../../shared/components/consistant.dart';
import '../../shared/style/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              SettingCubit.get(context).isDark ? appBarDarkColor : defaultColor,
          title: Text(S.of(context).SettingsDraw,),
        ),
        body: BlocBuilder<SettingCubit, SettingsStates>(
          builder: (context, state) {
            var cubit = SettingCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           cubit.isDark
                  //               ? Icons.brightness_2_outlined
                  //               : Icons.brightness_5,
                  //           size: 30+cubit.textSize,
                  //           color: Colors.blueGrey,
                  //         ),
                  //         SizedBox(
                  //           width: 15,
                  //         ),
                  //         Text(
                  //           S.of(context).change_theme,
                  //           style: TextStyle(
                  //               fontSize: 19+cubit.textSize,
                  //               fontWeight: FontWeight.bold,
                  //               color: cubit.isDark
                  //                   ? Colors.white60
                  //                   : Colors.black),
                  //         ),
                  //       ],
                  //     ),
                  //     Spacer(),
                  //     Container(
                  //       height: 40 + cubit.textSize,
                  //       child: LiteRollingSwitch(
                  //         width: cubit.textSize >= 0
                  //             ? 145 + cubit.textSize + 15
                  //             : 145 + cubit.textSize,
                  //         onTap: () {
                  //           setState(() {
                  //             isDayModeChange = cubit.isDark;
                  //           });
                  //         },
                  //         onDoubleTap: () {},
                  //         onSwipe: () {},
                  //         value: cubit.isDark,
                  //         textOn: S.of(context).dark,
                  //         textOff: S.of(context).light,
                  //         colorOn: Colors.blueGrey[700]!,
                  //         colorOff: Colors.amber,
                  //         iconOn: Icons.brightness_2_outlined,
                  //         iconOff: Icons.brightness_5,
                  //         textSize: 16.0 + cubit.textSize,
                  //         onChanged: (value) {
                  //           cubit.changeMode();
                  //         },
                  //       ),
                  //     ),
                  //     // Switch(
                  //     //   splashRadius: 3,
                  //     //   activeColor: defaultColor,
                  //     //   value: cubit.isDark,
                  //     //   onChanged: (value) {
                  //     //     cubit.changeMode();
                  //     //   },
                  //     // ),
                  //     SizedBox(
                  //       width: 15,
                  //     )
                  //   ],
                  // ),
                  // Divider(
                  //   height: 20,
                  //   indent: 20,
                  //   endIndent: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 30+cubit.textSize,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            S.of(context).change_language,
                            style: TextStyle(
                                fontSize: 19+cubit.textSize,
                                fontWeight: FontWeight.bold,
                                color: cubit.isDark
                                    ? Colors.white60
                                    : Colors.black),
                          ),
                        ],
                      ),
                      Spacer(),
                      DropdownButton(
                       
                        value: currentLanguage,
                        dropdownColor:
                            cubit.isDark ? Colors.grey[600] : Colors.white,

                        items: Languages.listLanguages()
                            .map((e) => DropdownMenuItem(
                                value: e.languagCode,
                                child: Row(
                                  children: [
                                    Text(
                                      e.flag!,
                                      style: TextStyle(
                                        fontSize: 16+cubit.textSize
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      e.name!,
                                      style: TextStyle(
                                          fontSize: 16+cubit.textSize,
                                          color: cubit.isDark
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
                          print(value);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Divider(
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.format_size,
                            size: 30+cubit.textSize,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            S.of(context).changeTextSize,
                            style: TextStyle(
                                fontSize: 19+cubit.textSize,
                                fontWeight: FontWeight.bold,
                                color: cubit.isDark
                                    ? Colors.white60
                                    : Colors.black),
                          ),
                          Spacer(),
                          Text(
                            cubit.textSize.toInt().toString(),
                            style: TextStyle(
                              fontSize: 21+cubit.textSize,
                                color: cubit.isDark
                                    ? Colors.white60
                                    : Colors.black),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      Slider(
                        max: 5,
                        min: -5,
                        divisions: 10,
                        value: cubit.textSize,
                        onChanged: (value) {
                          // setState(() {
                          //   valSize = value;
                          // });
                          cubit.changeTextSized(value);
                        },
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
