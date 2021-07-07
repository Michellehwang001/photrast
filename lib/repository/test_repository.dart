import 'package:flutter/material.dart';

class TestRepository with ChangeNotifier {

  //Q. 찍은 사진들의 이름을 토대로 List에 자동으로 추가되는 법?
  List travelPhotos = [
    // "assets/example1.jpg",
    "assets/202109101346.jpg",
    "assets/202109101347.jpg",
    "assets/202109101348.jpg",
    "assets/202109101349.jpg",
    "assets/202109101350.jpg",
    "assets/202109101351.jpg",
    "assets/202109101352.jpg",
  ];

    //Q. 찍은 사진들의 시간이 List에 자동으로 추가되는 법?
  List travelTime = [
    "2021년",
    "2021년 09월 10일 13시 47분",
    "2021년 09월 10일 13시 47분",
    "2021년 09월 10일 13시 47분",
    "2021년 09월 10일 13시 47분",
    "2021년 09월 10일 13시 47분",
    "2021년 09월 10일 13시 47분",

  ];

  //Q. 찍은 사진들의 위치가 List에 자동으로 추가되는 법?
  List travelPosition = [
    "서울시 강남구 강남동 26-2",
    "서울시 강남구 양재동 80-3",
    "서울시 강남구 양재동 80-3",
    "서울시 강남구 양재동 80-3",
    "서울시 강남구 양재동 80-3",
    "서울시 강남구 양재동 80-3",
    "서울시 강남구 양재동 80-3",

  ];

  // notifyListeners();

}