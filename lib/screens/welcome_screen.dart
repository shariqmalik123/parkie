import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkie/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:parkie/screens/parking_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    controller!.forward();

    controller!.addListener(() {
      setState(() {});
      // ignore: avoid_print
      print(animation!.value);
      if (controller!.status == AnimationStatus.completed) {
        Navigator.pushNamed(context, ParkingScreen.id);
      }
    });
  }

  @override
  void dispose() {
    // todo: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme,
      body: Center(
        child: Stack(children: [
          Container(
              height: 379.h,
              width: 370.w,
              decoration: const BoxDecoration(
                  color: largeCircleColor,
                  borderRadius: BorderRadius.all(Radius.circular(200))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 301.h,
                    width: 301.h,
                    decoration: const BoxDecoration(
                        color: mediumCircleColor,
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Center(
                      child: Container(
                          height: 219.h,
                          width: 219.w,
                          decoration: const BoxDecoration(
                              color: smallCircle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200))),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 47, top: 0, right: 30),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            width: 137.w,
                                            height: 141.h,
                                            child:
                                                Image.asset('images/car1.png')),
                                        SingleChildScrollView(
                                          child: DefaultTextStyle(
                                            style: const TextStyle(
                                              fontFamily: "Anta-Regular.ttf",
                                              fontWeight: FontWeight.w900,
                                              fontSize: 42,
                                              color: Color(0xFF433F56),
                                            ),
                                            child:
                                                AnimatedTextKit(animatedTexts: [
                                              FadeAnimatedText(
                                                'Parkie',
                                              ),
                                            ], totalRepeatCount: 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
