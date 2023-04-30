import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var isLoading = true.obs;
  var address = ''.obs;
  var country = ''.obs;
  var city = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    // Start loading state
    isLoading.value = true;

    try {
      // Get the user's current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocode the user's position to get their address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      print(placemarks);
      // Set the address value to the first address in the placemarks list
      address.value = placemarks[0].locality!;
      country.value = placemarks[0].country!;
      city.value = placemarks[0].administrativeArea!;
    } catch (e) {
      // Handle any errors that occur
      print(e.toString());
    }

    // Stop loading state
    isLoading.value = false;
  }
}
