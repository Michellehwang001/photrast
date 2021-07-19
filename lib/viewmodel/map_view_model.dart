import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/repository/location_repository.dart';

class MapViewModel with ChangeNotifier {
  final _locationRepository = LocationRepository();
  late Position position;
  bool isLoading = true;
  int selectedPage = 0;

  MapViewModel() {
    fetch();
  }

  Future fetch() async {
    position = await _locationRepository.getCurrentLocation();
    isLoading = false;
    notifyListeners();
    print('fetch 성공.');
  }

  void changePage (int index) {
    selectedPage = index;
    print('Change Page to $index');
    notifyListeners();
  }
}