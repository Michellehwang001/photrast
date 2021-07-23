import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/place_info.dart';

class PlaceRepository {
  final List<Item> items = [];

  Future<List<Item>> fetchData(mapx, mapy, typeID, rad) async {
    String url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=l32ogI8HTVFiWOJB%2BmMSPbD%2BAExpCboabtx1ke0l0oLAJn0G5PlDB7SVXps5BGU8h7HU2woXDP5t69rN7mFytw%3D%3D&contentTypeId=$typeID&mapX=$mapx&mapY=$mapy&radius=$rad&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json';
    print ('url --> $url');
    var response = await http.get(Uri.parse(url));

    // 성공
    if(response.statusCode == 200) {
      // utf8로 decode 한다.
      final jsonResult = json.decode(utf8.decode(response.bodyBytes));
      final jsonItems = jsonResult['response']['body']['items']['item'];

      if(jsonItems != null) {
        // 새로이 items 를 생성하기 위해 비워둔다!!!!
        items.clear();

        // 익명함수 List<stores>를 만들어 준다.
        jsonItems.forEach((e) {
          //fromJson(json.decode(utf8.decode(response.bodyBytes)));
          Item item = Item.fromJson(e);
          items.add(item);
        });
        print('fetch 완료');

      } else {
        print('PlaceRepository 데이터를 가져오지 못했습니다.');
      }
    }
    return items;
  }


}