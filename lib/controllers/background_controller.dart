import 'dart:async';
import 'package:adhan_app/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  RxString backgroundImage = ''.obs;

  @override
  void onInit() {
    _getTime();
    Timer.periodic(Duration(hours: 1), (timer) {
      _getTime();
    });
    super.onInit();
  }

  late Timer _timer;

  void _getTime() {
    var now = DateTime.now();
    var currentTime = now.hour;

    if (currentTime >= 3 && currentTime < 8) {
      backgroundImage.value = fajr;
    } else if (currentTime >= 8 && currentTime < 13) {
      backgroundImage.value = duhar;
    } else if (currentTime >= 13 && currentTime < 17) {
      backgroundImage.value = asr;
    } else if (currentTime >= 17 && currentTime < 20) {
      backgroundImage.value = maghrib;
    } else {
      backgroundImage.value = isha;
    }
  }
}
