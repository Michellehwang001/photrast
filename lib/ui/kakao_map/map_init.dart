import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapInit extends StatefulWidget {
  const MapInit({Key? key}) : super(key: key);

  @override
  _MapInitState createState() => _MapInitState();
}

class _MapInitState extends State<MapInit> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('카카오맵 - 관광지'),
        ),
        body: WebView(
          initialUrl: 'https://michellehwang001.github.io/web/index.html',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            // late 초기화
            _webViewController = webViewController;
          },
        ),
    );
  }
}
