import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/model/model.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MapInit extends StatefulWidget {
  const MapInit({Key? key}) : super(key: key);

  @override
  _MapInitState createState() => _MapInitState();
}

class _MapInitState extends State<MapInit> {

  //late WebViewController _webViewController;
  // late InAppWebViewController _webViewController;

  TestResult? result;

  Future<TestResult> fetchData(int typeID, int rad) async {
    var response = await http.get(Uri.parse(
    'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=l32ogI8HTVFiWOJB%2BmMSPbD%2BAExpCboabtx1ke0l0oLAJn0G5PlDB7SVXps5BGU8h7HU2woXDP5t69rN7mFytw%3D%3D&contentTypeId=$typeID&mapX=126.981106&mapY=37.568477&radius=$rad&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json'
    ));


    TestResult result =
        TestResult.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    return result;
  }

  @override
  void initState() {
    super.initState();

    fetchData(38, 1000).then((value) {
      setState(() {
        result = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();


    if (mapViewModel.isLoading == false) {
      final lng = mapViewModel.position.longitude;
      final lat = mapViewModel.position.latitude;
      print(
          'https://www.igottabook.com/photrast/kakao_map_my_location.html?lat=$lat&lng=$lng');
    }

    return Scaffold(
      // isLoading 에 따른 분류..
      body: mapViewModel.isLoading == true
          ? Center(child: CircularProgressIndicator())
          : _loadingWebView(
              mapViewModel.position.longitude, mapViewModel.position.latitude, context),
    );
  }

  Widget _loadingWebView(double lng, double lat, context) {
    // 카카오맵 로딩 url
    String url =
        'https://www.igottabook.com/photrast/kakao_map_my_location.html?lat=$lat&lng=$lng';
    final Completer controllerCompleter = Completer<InAppWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    InAppWebViewController _webViewController;
    var provider = Provider.of<TestRepository>(context);
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: InAppWebView(
            key: GlobalKey(),
            initialUrlRequest: URLRequest(url: Uri.parse(url)),
            onWebViewCreated: (controller) {
              // controllerCompleter.complete(controller);
              _webViewController = controller;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                provider.typeID=12;
                TestResult? value = await fetchData(provider.typeID,provider.rad );
                setState(() {
                  result = value;
                });
              },
              child: Text('관광지'),
            ),
            ElevatedButton(
              onPressed: (){
                provider.typeID=39;
                fetchData(provider.typeID, provider.rad).then((value) {
                  setState(() {
                    result = value;
                  });
                });},
              child: Text('식당'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.typeID=32;
                fetchData(provider.typeID, provider.rad).then((value) {
                setState(() {
                  result = value;
                });
              });},
              child: Text('숙박'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.typeID=38;
                fetchData(provider.typeID, provider.rad).then((value) {
                setState(() {
                  result = value;
                });
              });},
              child: Text('쇼핑'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                provider.rad=500;
                TestResult? value = await fetchData(provider.typeID, provider.rad);
                setState(() {
                  result = value;
                });
              },
              child: Text('500m'),
            ),
            ElevatedButton(
              onPressed: (){
                provider.rad=1000;
                fetchData(provider.typeID, provider.rad).then((value) {
                  setState(() {
                    result = value;
                  });
                });},
              child: Text('1Km'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.rad=2000;
                fetchData(provider.typeID, provider.rad).then((value) {
                setState(() {
                  result = value;
                });
              });},
              child: Text('2Km'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.rad=10000;
                fetchData(provider.typeID, provider.rad).then((value) {
                setState(() {
                  result = value;
                });
              });},
              child: Text('10Km'),
            ),
          ],
        ),
        Flexible(
          flex: 1,
          // child: Center(),
          child: ListView.builder(
            itemBuilder: (context, index) => buildItem(index),
            itemCount: result?.response!.body!.items!.item!.length,
          ),
        ),
      ],
    );
  }

  Widget buildItem(index) {
    return Column(
      children: [
        Image.network(
            '${result?.response!.body!.items!.item![index].firstimage}'),
        Text('${result?.response!.body!.items!.item![index].title}'),
        Text('${result?.response!.body!.items!.item![index].addr1}'),
      ],
    );
  }
}
