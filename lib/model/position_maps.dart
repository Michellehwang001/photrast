class PositionMaps {
  List<PositionMaps>? positionMaps;

  PositionMaps({
      this.positionMaps});

  PositionMaps.fromJson(dynamic json) {
    if (json["positionMaps"] != null) {
      positionMaps = [];
      json["positionMaps"].forEach((v) {
        positionMaps?.add(PositionMaps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (positionMaps != null) {
      map["positionMaps"] = positionMaps?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PositionMap {
  double? mapx;
  double? mapy;

  PositionMap({
      this.mapx, 
      this.mapy});

  PositionMap.fromJson(dynamic json) {
    mapx = json["mapx"];
    mapy = json["mapy"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["mapx"] = mapx;
    map["mapy"] = mapy;
    return map;
  }

}