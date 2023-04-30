import 'package:adhan_app/constants/images.dart';
import 'package:adhan_app/controllers/position_controller.dart';
import 'package:adhan_app/controllers/prayerTime/prayerTime_controller.dart';

import 'package:flutter/material.dart';
import 'package:adhan_app/controllers/splash_fadeIn_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    final PrayerController = Get.put(PrayerTimeController());
    final posController = Get.put(LocationController());

    controller.startSplashAnimation();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffffa96e),
      body: Center(
        child: Image(image: AssetImage(logo)),
      ),
    ));
  }
}
