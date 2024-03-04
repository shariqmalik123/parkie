import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkie/screens/home-screen.dart';
import 'package:parkie/screens/map_screen.dart';
import 'package:parkie/screens/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkie/screens/parking_screen.dart';

void main() {
  runApp(const ParkieApp());
}

class ParkieApp extends StatelessWidget {
  const ParkieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
          initialRoute: WelcomeScreen.id,
          routes: {
            WelcomeScreen.id: (context) => const WelcomeScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
            ParkingScreen.id: (context) => const ParkingScreen(),
            MapScreen.id: (context) => const MapScreen(),
          },
        );
      },
    );
  }
}
