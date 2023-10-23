import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
            ),
            buildTitleSec(),
            Container(
              height: 240,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => buildLoading(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            buildTitleSec(),
            Container(
              height: 240,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => buildLoading(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            buildTitleSec(),
            Container(
              height: 240,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => buildLoading(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildLoading() => Shimmer.fromColors(
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 230,
        width: 230,
        decoration: BoxDecoration(
            color: Colors.white54, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 110,
            height: 20,
            color: Colors.white70,
          ),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
    );

Widget buildTitleSec({double width = 250}) => Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 20,
          width: width,
          color: Colors.white60,
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
    );
