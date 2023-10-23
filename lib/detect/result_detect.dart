import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../generated/l10n.dart';
import '../modules/settings/cubit.dart';
import '../shared/style/colors.dart';

class Detection extends StatefulWidget {
  final int index;
  Detection({required this.index, super.key});

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(S.of(context).detect_lab),
              centerTitle: true,
              backgroundColor: SettingCubit.get(context).isDark
                  ? appBarDarkColor
                  : Color.fromARGB(255, 67, 107, 128),
            ),
            body: ListView(children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if (widget.index == 2)
                    //   Text(
                    //     'Alzheimer',
                    //     style: TextStyle(color: Colors.amber),
                    //   ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildCustomBottun(context,
                          splashcol: Colors.blueGrey,
                          col: Color.fromARGB(255, 47, 86, 119),
                          text: S.of(context).uImage,
                          icon: Icons.upload, onpress: () {
                        scaffoldKey.currentState!
                            .showBottomSheet(
                                backgroundColor:
                                    SettingCubit.get(context).isDark
                                        ? Colors.grey[700]
                                        : Colors.grey[200],
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                ),
                                elevation: 15,
                                (context) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Positioned(
                                            top: -10,
                                            left: 5,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  size: 25,
                                                )),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Divider(
                                                thickness: 5,
                                                height: 5,
                                                indent: 145,
                                                endIndent: 145,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    S.of(context).imgeFrom,
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        wordSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: SettingCubit.get(
                                                                    context)
                                                                .isDark
                                                            ? Colors.white70
                                                            : Colors.blueGrey),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: buildCustomBottun(
                                                        context,
                                                        text: S.of(context).gal,
                                                        icon: Icons
                                                            .image_outlined,
                                                        col: Colors
                                                            .lightBlue.shade600,
                                                        onpress: () async {
                                                          await AppCubit.get(
                                                                  context)
                                                              .uploadImage(
                                                                  ImageSource
                                                                      .gallery);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: buildCustomBottun(
                                                        context,
                                                        text: S.of(context).cam,
                                                        icon: Icons.camera,
                                                        col: Colors.blueAccent
                                                            .shade400,
                                                        onpress: () async {
                                                          await AppCubit.get(
                                                                  context)
                                                              .uploadImage(
                                                                  ImageSource
                                                                      .camera);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                            .closed
                            .then((value) => null);
                      }),
                    ),
                    AppCubit.get(context).image == null
                        ? SettingCubit.get(context).isDark != true
                            ? Padding(
                                padding: EdgeInsets.all(8),
                                child: Lottie.asset(
                                    "assets/animations/animation_ll6va5ls.json",
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.8),
                              )
                            : Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [
                                    Colors.blueGrey.shade400,
                                    Colors.grey.shade400,
                                    Colors.white
                                  ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Your X-ray',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 66, 87, 97),
                                            fontFamily: 'Alexandria'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(0, 2),
                                            blurRadius: 15,
                                            spreadRadius: 2)
                                      ]),
                                      child: Image.file(
                                        AppCubit.get(context).image!,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                    height: 15,
                                    thickness: 5,
                                    indent: 50,
                                    endIndent: 50,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: isArabic() ? 15 : 5,
                                          top: 25,
                                          left: 15,
                                          bottom: 25),
                                      child: Text(
                                        'Your Resulat : #####################################################################',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
