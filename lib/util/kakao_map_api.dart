import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:project/model/place_info.dart';
import 'package:project/model/position_map.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:project/viewmodel/place_view_model.dart';
import 'package:provider/provider.dart';

class KakaoMapApi extends StatelessWidget {
  final String kakaoMapKey = 'bb3058b5de4a712fc2234784a0bc4075';
  final List<PositionMap> positionMaps = [];
  // final List<PositionMap> positionMaps = [
  //   PositionMap(mapx: 33.450701, mapy: 126.570667),
  //   PositionMap(mapx: 33.451001, mapy: 126.570967),
  //   PositionMap(mapx: 33.451301, mapy: 126.571267),
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final placeViewModel = context.watch<PlaceViewModel>();
    //final mapViewModel = context.read<MapViewModel>();

    // map정보가져와서 marker 만들기
    //String marker = getPlaceMaps(placeViewModel.items);
    String marker = 'addMarker(new kakao.maps.LatLng(37.568477, 126.981106));';
    String getMarker = getPlaceMaps(placeViewModel.items);

    print('marker --> $marker');
    print('getMarker--> $getMarker');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KakaoMapView(
              width: size.width,
              height: size.height / 9 * 3,
              kakaoMapKey: kakaoMapKey,
              // lat: mapViewModel.position?.latitude ?? 0.0,
              // lng: mapViewModel.position?.longitude ?? 0.0,
              lat: 37.568477,
              lng: 126.981106,
              markerImageURL: 'https://michellehwang001.github.io/web/images/logo_img.png',
              customScript: '''
              var markers = [];

              function addMarker(position) {
                var marker = new kakao.maps.Marker({position: position});
                marker.setMap(map);
                markers.push(marker);
              }
              '''
              +
                  marker + getMarker
              +
              '''
              var zoomControl = new kakao.maps.ZoomControl();
              map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

              var mapTypeControl = new kakao.maps.MapTypeControl();
              map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

              ''',
              onTapMarker: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message.message)));
              }),
          // ElevatedButton(
          //     child: Text('Kakao map screen'),
          //     onPressed: () async {
          //       await _openKakaoMapScreen(context);
          //     })
        ],
      ),
    );
  }

  String getPlaceMaps(List<Item> items) {
    String marker;

    positionMaps.clear();

    // map 정보 가져오기
    items.map((item) {
      PositionMap map = PositionMap(lat: item.mapy, lon: item.mapx);
      positionMaps.add(map);
    }).toList();

    marker = makeStringMarker(positionMaps);

    return marker;
  }

  String makeStringMarker(List<PositionMap> maps) {
    String result = '';
    maps.map((map) {
      result = result + 'addMarker(new kakao.maps.LatLng(' + map.lat.toString() + ', ' + map.lon.toString() + '));';
    }).toList();

    return result;
  }


  // Future<void> _openKakaoMapScreen(BuildContext context) async {
  //   KakaoMapUtil util = KakaoMapUtil();
  //
  //   // String url = await util.getResolvedLink(
  //   //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));
  //
  //   /// This is short form of the above comment
  //   String url =
  //       await util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');
  //
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  // }

}
