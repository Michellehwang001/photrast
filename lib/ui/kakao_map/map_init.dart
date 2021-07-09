import 'package:flutter/material.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapInit extends StatefulWidget {
  const MapInit({Key? key}) : super(key: key);

  @override
  _MapInitState createState() => _MapInitState();
}

class _MapInitState extends State<MapInit> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // context.read<MapViewModel>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();

    if(mapViewModel.isLoading == false) {
      final lng = mapViewModel.position.longitude;
      final lat = mapViewModel.position.latitude;
      print('https://www.igottabook.com/photrast/kakao_map_my_location.html?lat=$lat&lng=$lng');
    }

    return Scaffold(
      appBar: AppBar(
            title: Text('카카오맵 - 관광지'),
        ),
        // isLoading 에 따른 분류..
        body:  mapViewModel.isLoading == true ? Center(child: CircularProgressIndicator()): _loadingWebView(mapViewModel.position.longitude, mapViewModel.position.latitude),
    );
  }

  Widget _loadingWebView(double lng, double lat) {
    String url = 'https://www.igottabook.com/photrast/kakao_map_my_location.html';

    // var postData = Uint8List.fromList(utf8.encode("firstname=Foo&surname=Bar"));

    // return InAppWebView(
    //   initialUrlRequest: URLRequest(
    //       url: Uri.parse("$url"),
    //       method: 'POST',
    //       body: Uint8List.fromList(utf8.encode("lat=$lat&lng=$lng")),
    //       headers: {
    //         'Content-Type': 'application/x-www-form-urlencoded'
    //       }
    //   ),
    //   onWebViewCreated: (controller) {},
    // );

    return WebView(
      initialUrl: '$url?lat=$lat&lng=$lng',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        // late 초기화
        _webViewController = webViewController;
      },
    );
  }
}
