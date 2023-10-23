import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../generated/l10n.dart';
import '../modules/settings/cubit.dart';
import '../shared/components/components.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen(this.startWidget,
      // this.skip,
      // this.isLast,
      // this.login,
      // this.email,
      // this.langu,
      {super.key});
  final Widget startWidget;
  // final bool skip;
  // final bool login;
  // final bool isLast;
  // final String? langu;
  // final String? email;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        color: SettingCubit.get(context).isDark
            ? Colors.black.withOpacity(0.8)
            : Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              top: 100,
              left: isArabic() ? MediaQuery.of(context).size.width * 0.38 : 25,
              // right: isArabic() ? 25 : 0,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).splashText1,
                        style: TextStyle(
                            fontSize: 35,
                            color: SettingCubit.get(context).isDark
                                ? Colors.white70
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Kalam')),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Medical Assistant',
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 40, 109, 166),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kalam'),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: -50,
              child: Lottie.asset("assets/animations/animation_ll6vc1g3.json"),
            ),
          ],
        ),
      ),
      nextScreen: startWidget,
      splashIconSize: MediaQuery.of(context).size.height,
      // duration: 10000000,
      duration: 2300,
      curve: Curves.bounceInOut,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(seconds: 1),
    );
  }
}
