import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PageViewController extends GetxController {
  static PageViewController get find => Get.find();

  final today = DateTime.now().obs;
  final format = DateFormat('dd-MM-yyyy');

  var leftButtonVisible = true.obs;
  var rightButtonVisible = true.obs;
  var index = 0.obs;
  PageController pageController = PageController(initialPage: 1);

  void yesterday() {
    if (index == 0) {
      today.value = today.value.subtract(Duration(days: 1));
      leftButtonVisible.value = false;

      index -= 1;
    } else if (index == 1) {
      today.value = today.value.subtract(Duration(days: 1));
      leftButtonVisible.value = true;
      rightButtonVisible.value = true;
      index -= 1;
    }
    print(index);
  }

  void tomorrow() {
    if (index == 0) {
      today.value = today.value.add(Duration(days: 1));
      rightButtonVisible.value = false;
      index += 1;
    } else if (index == -1) {
      today.value = today.value.add(Duration(days: 1));
      rightButtonVisible.value = true;
      leftButtonVisible.value = true;
      index += 1;
    }
    print(today.value);
  }
}
