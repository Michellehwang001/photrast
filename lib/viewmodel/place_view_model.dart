import 'package:flutter/foundation.dart';
import 'package:project/model/place_info.dart';
import 'package:project/repository/place_repository.dart';

class PlaceViewModel with ChangeNotifier{
  bool isLoading = false;
  List<Item> items = [];
  //mapx=126.981106, mapy=37.568477, typeID=38, rad=1000
  double _mapx = 126.981106;
  double _mapy = 37.568477;
  // double _mapx;
  // double _mapy;
  int _typeID;
  int _rad;
  String markers = '';

  void setMap(double x, double y) {
    _mapx = x;
    _mapy = y;
    fetch();
  }

  set typeID(int value) {
    _typeID = value;
    fetch();
  }

  set rad(int value) {
    _rad = value;
    fetch();
  }


  PlaceViewModel(this._mapx, this._mapy, [this._typeID = 38, this._rad = 1000]){
    fetch();
  }

  final _placeRepository = PlaceRepository();

  Future fetch() async{
    isLoading = true;
    notifyListeners();

    await _placeRepository.fetchData(_mapx, _mapy, _typeID, _rad).then((values) {
      items = values;
      markers = makeStringMarker(values);
      print('markers--> $markers');

      isLoading = false;
      notifyListeners();
    });

  }

  // Map Marker정보도 여기에 만들자..
  String makeStringMarker(List<Item> values) {
    String result = '';

    values.map((e) {
      result = result
          + 'addMarker(new kakao.maps.LatLng( ${e.mapy}, ${e.mapx}));';
    }).toList();

    return result;
  }

}