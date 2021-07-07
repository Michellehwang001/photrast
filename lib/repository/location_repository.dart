import 'package:geolocator/geolocator.dart';

class LocationRepository {
  // final _geolocation = Geolocator();

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 위치 세팅하는 부분 추가
      if(await Geolocator.openLocationSettings() == false) {
        return Future.error('Location permissions are denied');
      }
    }

    // Position return
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}