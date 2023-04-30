import 'package:adhan_app/constants/images.dart';
import 'package:adhan_app/others/notif_services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PrayerTimeController extends GetxController {
  var _latitude = 0.0;
  var _longitude = 0.0;

  var now = new DateTime.now().obs;
  var formatter = new DateFormat('dd-MM-yyyy');

  var timings = {}.obs;
  var dateD = {}.obs;
  var dateR = {}.obs;
  var dateHijri = {}.obs;
  var weekday = {}.obs;
  var month = {}.obs;
  var fajr = ''.obs;
  var dhuhr = ''.obs;
  var asr = ''.obs;
  var maghrib = ''.obs;
  var isha = ''.obs;
  var weekdayar = ''.obs;
  var monthar = ''.obs;
  var day = ''.obs;
  var year = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getPTLocation(DateTime.now());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future getPTLocation(DateTime time) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    _latitude = position.latitude;
    _longitude = position.longitude;
    String formattedDate = formatter.format(time);

    final url =
        "https://api.aladhan.com/v1/timings/$formattedDate?latitude=$_latitude&longitude=$_longitude&method=8";

    http.Response res = await http.get(Uri.parse(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    Map data = json.decode(res.body);

    print(data);

    timings.value = data['data']['timings'];
    print(timings.value);
    fajr.value = timings.value['Fajr'];
    dhuhr.value = timings.value['Dhuhr'];
    asr.value = timings.value['Asr'];
    maghrib.value = timings.value['Maghrib'];
    isha.value = timings.value['Isha'];
    dateD.value = data['data']['date'];

    dateHijri.value = dateD.value['hijri'];

    weekday.value = dateHijri.value['weekday'];
    weekdayar.value = weekday.value['ar'];
    day.value = dateHijri.value['day'];
    month.value = dateHijri.value['month'];
    monthar.value = month.value['ar'];
  }
}
