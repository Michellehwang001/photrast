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

    items = await _placeRepository.fetchData(_mapx, _mapy, _typeID, _rad);

    isLoading = false;
    notifyListeners();
  }


}