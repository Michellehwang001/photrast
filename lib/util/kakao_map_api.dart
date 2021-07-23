import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:project/model/position_map.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:project/viewmodel/place_view_model.dart';
import 'package:provider/provider.dart';

class KakaoMapApi extends StatefulWidget {
  @override
  _KakaoMapApiState createState() => _KakaoMapApiState();
}

class _KakaoMapApiState extends State<KakaoMapApi> {
  final String kakaoMapKey = 'bb3058b5de4a712fc2234784a0bc4075';
  final List<PositionMap> positionMaps = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    final placeViewModel = context.watch<PlaceViewModel>();
    //final mapViewModel = context.read<MapViewModel>();

    // map정보가져와서 marker 만들기
    String marker = 'addMarker(new kakao.maps.LatLng(37.568477, 126.981106)); ';
    String getMarker = marker + placeViewModel.markers;
    print('getMarker --> $getMarker');

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
              customScript: '''
        var markers = [];
        function addMarker(position) {
          var marker = new kakao.maps.Marker({position: position});
          marker.setMap(map);
          markers.push(marker);
        }
        
        $getMarker
        
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

}
