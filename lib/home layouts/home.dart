// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:graduation_project/home%20layouts/ocr_home.dart';
import 'package:graduation_project/home%20layouts/x-ray_home.dart';
import 'package:graduation_project/modules/settings/cubit.dart';
import '../generated/l10n.dart';
import '../modules/drawer.dart';
import '../search/search.dart';
import '../shared/components/components.dart';
import '../shared/components/consistant.dart';
import '../shared/networks/local/cache_helper.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  List titleHomeEN = ['X-Ray', 'OCR', '🇪🇬 News'];
  List titleHomeAR = ["الأشعة السينية", "الأشعة المكتوبة", '🇪🇬 الاخبار'];
  List<Color> colorBottom = [
    const Color.fromARGB(255, 97, 97, 97),
    Colors.cyan
  ];

  bool isXRaySelected = true;
  bool isOCRSelected = false;
  bool isNewsSelected = false;

  List<Widget> screens = [
    const x_rayPage(),
    const ocrPage(),
    const News(),
  ];

  void _updateSelectedBottom(int index) {
    setState(() {
      isXRaySelected = index == 0;
      isOCRSelected = index == 1;
      isNewsSelected = index == 2;
    });
  }

  TabController? _tabController;
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
    // _tabController = new TabController(
    //   length: 2,
    //   vsync: this,
    // );
  }

  // bool isDarkModeEnabled = CacheHelper.getData(key: 'isDark');
  // void onStateChanged(bool isDarkModeEnabled) {
  //   setState(() {
  //     this.isDarkModeEnabled = isDarkModeEnabled;
  //   });
  // SettingCubit.get(context).changeMode();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Center(
            child: Text(
          'Medical Assistant',
          // isArabic() ? titleHomeAR[currentIndex] : titleHomeEN[currentIndex],
          style: Theme.of(context).textTheme.headline6,
        )),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
          ),
        ],
        // bottom: TabBar(controller: _tabController, tabs: [
        //   Tab(
        //     child: Text('X-Ray',
        //         style: TextStyle(
        //             fontFamily: 'Alexandria',
        //             fontSize: 5,
        //             color: isXRaySelected ? colorBottom[1] : colorBottom[0])),
        //   ),
        //   Tab(
        //     height: 1,
        //     child: Text('OCR',
        //         style: TextStyle(
        //             fontFamily: 'Alexandria',
        //             fontSize: 5,
        //             color: isOCRSelected ? colorBottom[1] : colorBottom[0])),
        //   )
        // ]),
      ),
      drawer: buildDrawer(context),
      floatingActionButton: FloatingActionButton(
          tooltip: 'ChatBot',
          onPressed: () {
            MassegeSnackBar(context, textContent: S.of(context).messageSoon1);

            // Navigator.pushNamed(context, "Chat Bot");
          },
          splashColor: Colors.transparent,
          child: Image.asset(
            "assets/images/chat-removebg-preview.png",
            fit: BoxFit.cover,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        notchMargin: 5,
        height: 50,
        clipBehavior: Clip.antiAlias,
        color: SettingCubit.get(context).isDark
            ? Color.fromRGBO(39, 42, 43, 1)
            : Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                      _updateSelectedBottom(0);
                    },
                    child: Container(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            size: 25,
                            color: isXRaySelected
                                ? colorBottom[1]
                                : colorBottom[0],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(S.of(context).nameX_Ray,
                              style: TextStyle(
                                  fontFamily: 'Alexandria',
                                  fontSize: 10,
                                  color: isXRaySelected
                                      ? colorBottom[1]
                                      : colorBottom[0])),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: isArabic()
                      ? MediaQuery.of(context).size.width * 0.03
                      : MediaQuery.of(context).size.width * 0.15,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      MassegeSnackBar(context,
                          textContent: S.of(context).messageSoon1);

                      // setState(() {
                      //   currentIndex = 1;
                      // });
                      // _updateSelectedBottom(1);
                    },
                    child: Container(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_filled,
                            size: 25,
                            color:
                                isOCRSelected ? colorBottom[1] : colorBottom[0],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(S.of(context).nameOCR,
                              style: TextStyle(
                                  fontFamily: 'Alexandria',
                                  fontSize: 10,
                                  color: isOCRSelected
                                      ? colorBottom[1]
                                      : colorBottom[0])),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // MassegeSnackBar(
                //   context,
                //   textContent: 'Soon ...',
                // );
                if (CacheHelper.getData(key: 'token') != null) {
                  setState(() {
                    currentIndex = 2;
                  });
                  _updateSelectedBottom(2);
                } else {
                  showToast(
                      text: S.of(context).messageSoon2,
                      state: ToastStates.Error);
                }
              },
              child: Container(
                height: 45,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.newspaper_rounded,
                      size: 25,
                      color: isNewsSelected ? colorBottom[1] : colorBottom[0],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                        currentLanguage == "en"
                            ? "${S.of(context).news} 🇺🇸"
                            : "${S.of(context).news} 🇪🇬",
                        style: TextStyle(
                            fontFamily: 'Alexandria',
                            fontSize: 13,
                            color: isNewsSelected
                                ? colorBottom[1]
                                : colorBottom[0])),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
