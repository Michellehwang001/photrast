// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:project/ui/kakao_map/map_init.dart';
import 'dart:convert';
import 'package:project/viewmodel/test_result.dart';

void main() {
  test(
    'http통신',
        () async {
      int rad = 1000;
      var response = await http.get(Uri.parse(
          'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?serviceKey=l32ogI8HTVFiWOJB%2BmMSPbD%2BAExpCboabtx1ke0l0oLAJn0G5PlDB7SVXps5BGU8h7HU2woXDP5t69rN7mFytw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&contentTypeId=15&mapX=126.981611&mapY=37.568477&radius=$rad&listYN=Y&_type=json'));
      // expect(response.statusCode, 200);
      // print(response.body);

      TestResult result = TestResult.fromJson(json.decode(response.body));

      for (int i = 0; i < 3; i++) {
        print('$i번째 출력');

        print(result.response!.body!.items!.item![i].mapx);
        print(result.response!.body!.items!.item![i].mapx is double? 'double' : 'string');
        print(result.response!.body!.items!.item![i].mapy);
        print(result.response!.body!.items!.item![i].mapy is double? 'double' : 'string');

      }
    },
  );
}
