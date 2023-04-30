import 'package:adhan_app/controllers/background_controller.dart';
import 'package:adhan_app/controllers/pageview_controller.dart';
import 'package:adhan_app/controllers/position_controller.dart';

import 'package:adhan_app/others/notif_services.dart';
import 'package:adhan_app/widgets/Praytime_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:adhan_app/controllers/prayerTime/prayerTime_controller.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PrayerTimeController controller = Get.put(PrayerTimeController());
    final positionController = Get.put(LocationController());

    final PageViewController pageViewController = Get.put(PageViewController());

    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Stack(
        children: [
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.backgroundImage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'مواقيت الصلاة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => Text(
                          '${positionController.country.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                    Obx(() => Text(
                          ' • ' + '${positionController.address.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Visibility(
                            visible: pageViewController.leftButtonVisible.value,
                            child: IconButton(
                                onPressed: () {
                                  pageViewController.pageController
                                      .previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                  pageViewController.yesterday();
                                  controller.getPTLocation(
                                      pageViewController.today.value);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible:
                                pageViewController.rightButtonVisible.value,
                            child: IconButton(
                                onPressed: () {
                                  pageViewController.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                  pageViewController.tomorrow();
                                  controller.getPTLocation(
                                      pageViewController.today.value);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 135,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                    pageViewController.format
                                        .format(pageViewController.today.value),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Text(controller.monthar.value,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Obx(
                                () => Text("  " + controller.day.value,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageViewController.pageController,
                      children: [
                        page(controller: controller),
                        page(controller: controller),
                        page(controller: controller),
                      ]),
                ),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}

class page extends StatelessWidget {
  const page({
    super.key,
    required this.controller,
  });

  final PrayerTimeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Times(
            controller: controller,
            time: controller.fajr.value,
            title: 'فجر',
            topRight: 10,
            topleft: 10,
          ),
        ),
        Obx(
          () => Times(
              controller: controller,
              title: 'ظهر',
              time: controller.dhuhr.value),
        ),
        Obx(() => Times(
            controller: controller, title: 'عصر', time: controller.asr.value)),
        Obx(
          () => Times(
              controller: controller,
              title: 'مغرب',
              time: controller.maghrib.value),
        ),
        Obx(
          () => Times(
            controller: controller,
            title: 'عشاء',
            time: controller.isha.value,
            bottomLeft: 10,
            bottomRight: 10,
          ),
        ),
      ],
    );
  }
}
