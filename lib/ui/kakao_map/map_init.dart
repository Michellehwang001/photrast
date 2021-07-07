import 'package:flutter/material.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

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
      print('https://michellehwang001.github.io/web/index.html?lat=$lat&lng=$lng');
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
    return WebView(
      initialUrl: 'https://michellehwang001.github.io/web/index.html?lat=$lat&lng=$lng',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        // late 초기화
        _webViewController = webViewController;
      },
    );
  }
}
