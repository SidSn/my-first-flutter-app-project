import 'package:adhan_app/screens/Prayer_timeScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 500));
    Get.off(
      // Get.off Instead of Get.offAll()
      () => PrayerTimeScreen(),
      duration: const Duration(milliseconds: 1000), //Transition Time
      transition: Transition.fadeIn, //Screen Switch Transition
    );
  }

//Can be used to animate In after calling the next screen.
  Future animationIn() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    animate.value = true;
  }

//Can be used to animate Out before calling the next screen.
  Future animationOut() async {
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
