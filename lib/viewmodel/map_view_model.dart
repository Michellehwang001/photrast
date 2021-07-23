import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/repository/location_repository.dart';

class MapViewModel with ChangeNotifier {
  final _locationRepository = LocationRepository();
  Position? position;
  bool isLoading = true;
  int selectedPage = 0;

  MapViewModel() {
    fetch();
  }

  Future fetch() async {
    position = await _locationRepository.getCurrentLocation();
    isLoading = false;
    notifyListeners();
  }

  // 페이지 이동.
  void changePage (int index) {
    // 현재 페이지 정보
    selectedPage = index;
    print('Change Page to $index');
    notifyListeners();
  }
}