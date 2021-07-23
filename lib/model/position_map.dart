class PositionMap {
  double? lat;
  double? lon;

  PositionMap({
      this.lat,
      this.lon});

  PositionMap.fromJson(dynamic json) {
    lat = json["mapy"];
    lon = json["mapx"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["mapx"] = lon;
    map["mapy"] = lat;
    return map;
  }

}