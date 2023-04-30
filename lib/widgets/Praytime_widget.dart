import 'package:adhan_app/controllers/prayerTime/prayerTime_controller.dart';
import 'package:flutter/material.dart';

class Times extends StatelessWidget {
  const Times({
    super.key,
    required this.controller,
    required this.title,
    required this.time,
    this.topleft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
  });

  final PrayerTimeController controller;
  final String title;
  final String time;
  final double topleft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 22, 20, 41),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topleft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(time,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 50,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
