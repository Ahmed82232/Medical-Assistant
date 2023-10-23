import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 17, 18, 24),
            Color.fromARGB(255, 25, 94, 150),
          ])
              // image: DecorationImage(
              //     image: AssetImage(
              //         'asserts/pexels-eberhard-grossgasteiger-2098427.jpg'),
              //     fit: BoxFit.fill)
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Graduation project by',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 105, 128, 190),
                                  fontSize: 22,
                                  fontFamily: 'Alexandria',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                                elevation: 0,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 5, end: 140),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    buildApoutUsItem(
                        text1: 'Eng', name: "Ahmed Hamdy", job: "Flutter"),
                    buildApoutUsItem(
                        text1: 'Eng', name: "Esraa Raafat", job: "Flutter"),
                    buildApoutUsItem(
                        text1: 'Eng', name: "Ahmed Farag", job: "AI"),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About App',
                      style: TextStyle(
                          color: Color.fromARGB(255, 105, 128, 190),
                          fontSize: 22,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 5,
                    end: 200,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Medical Application\nWith Flutter and AI ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(166, 255, 255, 255)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Our application will help many people, whether patients or doctors.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(113, 255, 255, 255)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Medicine field one of the most important science in our life and what about if we mix it with engineering ?, this is our plan that we designed the app, medical application deployed in flutter to give the application artificial mentality to diagnose multiple diseases with out human interaction and with high accuracy over humans using deep leaning and computer vision techniques.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(113, 255, 255, 255)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'But again, you must not rely entirely on the diagnosis of the disease from the application because it is still in the development stage, so you must also consult a doctor.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(113, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
