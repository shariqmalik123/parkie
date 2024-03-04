// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parkie/colors.dart';
import 'package:parkie/screens/map_screen.dart';
import 'package:parkie/screens/welcome_screen.dart';
import 'package:parkie/widget/color_changing_container.dart';

enum Type {
  car,
  bike,
  bus,
}

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Type? selectedType;
  String _carImage = 'images/Car3.png';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: darkTheme,
          appBar: AppBar(
            backgroundColor: darkTheme,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('images/unknown-user2.png'),
                  ),
                ),
                const Text(
                  'Parkie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Anta-Regular.ttf',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const MapScreen());
                    print('Navigated to Google map');
                  },
                  child: const Icon(
                    FontAwesomeIcons.locationDot,
                    color: Color(0xFFDDD9F0),
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 27, top: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello Shariq Malik',
                    style: TextStyle(color: Color(0xFFD9D8E0), fontSize: 20),
                  ),
                  const Text(
                    'Looking for',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Anta-Regular.ttf',
                    ),
                  ),
                  const Text(
                    'Parking?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedType = Type.car;
                            _carImage = 'images/Car3.png';
                          });
                        },
                        child: ColorChangingContainer(
                          containerColor: selectedType == Type.car
                              ? inActiveContainerColor
                              : activeContainerColor,
                          containerIcon: Icon(
                            FontAwesomeIcons.car,
                            size: 30,
                            color: selectedType == Type.car
                                ? inActiveTextColor
                                : activeTextColor,
                          ),
                          containerText: 'Car',
                          myTextColor: selectedType == Type.car
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedType = Type.bike;
                            _carImage = 'images/bike.png';
                          });
                        },
                        child: ColorChangingContainer(
                          containerColor: selectedType == Type.bike
                              ? inActiveContainerColor
                              : activeContainerColor,
                          containerIcon: Icon(
                            FontAwesomeIcons.motorcycle,
                            size: 30,
                            color: selectedType == Type.car
                                ? inActiveTextColor
                                : activeTextColor,
                          ),
                          containerText: 'Bike',
                          myTextColor: selectedType == Type.bike
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedType = Type.bus;
                            _carImage = 'images/bus.png';
                          });
                        },
                        child: ColorChangingContainer(
                          containerColor: selectedType == Type.bus
                              ? inActiveContainerColor
                              : activeContainerColor,
                          containerIcon: Icon(
                            FontAwesomeIcons.bus,
                            size: 30,
                            color: selectedType == Type.bus
                                ? inActiveTextColor
                                : activeTextColor,
                          ),
                          containerText: 'Bus',
                          myTextColor: selectedType == Type.bus
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/line1.png'),
                            const SizedBox(width: 80),
                            Image.asset(
                              _carImage,
                              height: 330.h,
                            ),
                            const SizedBox(width: 75),
                            Image.asset('images/line2.png')
                          ],
                        ),
                        Positioned(
                          left: 127,
                          top: 280,
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  Get.to(const MapScreen());
                                },
                                child: Container(
                                  height: 80.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 39, 214, 4)
                                              .withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text(
                                      'Tap to\n  add',
                                      style: TextStyle(
                                        fontFamily: 'Anta-Regular.ttf',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to close the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        });
    return exitApp;
  }
}
