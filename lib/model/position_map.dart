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