import 'package:flutter/material.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class KakaomapWebview extends StatefulWidget {
  const KakaomapWebview({Key? key}) : super(key: key);

  @override
  _KakaomapWebviewState createState() => _KakaomapWebviewState();
}

class _KakaomapWebviewState extends State<KakaomapWebview> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'messageHandler',
        onMessageReceived: (JavascriptMessage message) {
          Navigator.pop(context, message.message);
        });
  }
}
