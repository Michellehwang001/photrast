import 'package:flutter/material.dart';

class TestRepository with ChangeNotifier {
  List<Map> data = [
    {
      "id": 1,
      "travelPhotos": "assets/202109101346.jpg",
      "travelTime": "2021년 09월 9일 13시 47분",
      "travelPosition": "서울시 강남구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": null,

    },
    {
      "id": 2,
      "travelPhotos": "assets/202109101347.jpg",
      "travelTime": "2021년 09월 10일 13시 47분",
      "travelPosition": "서울시 중구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "물놀이 중",
    },
    {
      "id": 3,
      "travelPhotos": "assets/202109101348.jpg",
      "travelTime": "2021년 09월 11일 13시 47분",
      "travelPosition": "서울시 송파구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "석양이 멋지다",
    },
    {
      "id": 4,
      "travelPhotos": "assets/202109101349.jpg",
      "travelTime": "2021년 09월 12일 13시 47분",
      "travelPosition": "서울시 서초구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "이런 뷰를 어디서 다시 볼 수 있을까",
    },
    {
      "id": 5,
      "travelPhotos": "assets/202109101350.jpg",
      "travelTime": "2021년 09월 13일 13시 47분",
      "travelPosition": "서울시 노원구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "너무 높히 날아서 간떨어지는 줄",
    },
    {
      "id": 6,
      "travelPhotos": "assets/202109101351.jpg",
      "travelTime": "2021년 09월 14일 13시 47분",
      "travelPosition": "서울시 종로구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "다시 가고픈 곳",
    },
    {
      "id": 7,
      "travelPhotos": "assets/202109101352.jpg",
      "travelTime": "2021년 09월 15일 13시 47분",
      "travelPosition": "서울시 강북구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "친구들아 10년뒤 다시 여행하자",
    },
    {
      "id": 8,
      "travelPhotos": "assets/202109101353.jpg",
      "travelTime": "2021년 09월 16일 13시 47분",
      "travelPosition": "서울시 강서구 강남동 26-2",
      "selectedFlag" : false,
      "travelMemo": "오픈카였다면..",
    },
  ];

  List selectedTravelList = [];

  Map<String, dynamic> travelFolder = {
    "items": [
      {
        "headTitle": "asdf",
        "contents": [
          {
            "id": 1,
            "travelPhotos": "assets/202109101346.jpg",
            "travelTime": "2021년 09월 9일 13시 47분",
            "travelPosition": "서울시 강남구 강남동 26-2",
            "travelMemo": "비행장에선 항상 설레인다",
          },
          {
            "id": 2,
            "travelPhotos": "assets/202109101347.jpg",
            "travelTime": "2021년 09월 10일 13시 47분",
            "travelPosition": "서울시 중구 강남동 26-2",
            "travelMemo": "물놀이 중",
          },
        ],
      },
      {
        "headTitle": "gasdfadf",
        "contents": [
          {
            "id": 3,
            "travelPhotos": "assets/202109101348.jpg",
            "travelTime": "2021년 09월 11일 13시 47분",
            "travelPosition": "서울시 송파구 강남동 26-2",
            "travelMemo": "석양이 멋지다",
          },
          {
            "id": 4,
            "travelPhotos": "assets/202109101349.jpg",
            "travelTime": "2021년 09월 12일 13시 47분",
            "travelPosition": "서울시 서초구 강남동 26-2",
            "travelMemo": "이런 뷰를 어디서 다시 볼 수 있을까",
          },
        ],
      },
    ],

  };



  List travelFolder1= [
      {
        "headTitle": "asdf",
        "contents": [
          {
            "id": 1,
            "travelPhotos": "assets/202109101346.jpg",
            "travelTime": "2021년 09월 9일 13시 47분",
            "travelPosition": "서울시 강남구 강남동 26-2",
            "travelMemo": "비행장에선 항상 설레인다",
          },
          {
            "id": 2,
            "travelPhotos": "assets/202109101347.jpg",
            "travelTime": "2021년 09월 10일 13시 47분",
            "travelPosition": "서울시 중구 강남동 26-2",
            "travelMemo": "물놀이 중",
          },
        ],
      },
      {
        "headTitle": "gasdfadf",
        "contents": [
          {
            "id": 3,
            "travelPhotos": "assets/202109101348.jpg",
            "travelTime": "2021년 09월 11일 13시 47분",
            "travelPosition": "서울시 송파구 강남동 26-2",
            "travelMemo": "석양이 멋지다",
          },
          {
            "id": 4,
            "travelPhotos": "assets/202109101349.jpg",
            "travelTime": "2021년 09월 12일 13시 47분",
            "travelPosition": "서울시 서초구 강남동 26-2",
            "travelMemo": "이런 뷰를 어디서 다시 볼 수 있을까",
          },
        ],
      },
    ];

  List travelFolder2= [];
  Map<String, dynamic> travelFolder3= {};



//
// //Q. 찍은 사진들의 이름을 토대로 List에 자동으로 추가되는 법?
// List travelPhotos = [
//   // "assets/example1.jpg",
//   "assets/202109101346.jpg",
//   "assets/202109101347.jpg",
//   "assets/202109101348.jpg",
//   "assets/202109101349.jpg",
//   "assets/202109101350.jpg",
//   "assets/202109101351.jpg",
//   "assets/202109101352.jpg",
// ];
//
//   //Q. 찍은 사진들의 시간이 List에 자동으로 추가되는 법?
// List travelTime = [
//   "2021년 09월 9일 13시 47분",
//   "2021년 09월 10일 13시 47분",
//   "2021년 09월 11일 13시 47분",
//   "2021년 09월 12일 13시 47분",
//   "2021년 09월 13일 13시 47분",
//   "2021년 09월 14일 13시 47분",
//   "2021년 09월 15일 13시 47분",
//   "2021년 09월 16일 13시 47분",
//
// ];
//
// //Q. 찍은 사진들의 위치가 List에 자동으로 추가되는 법?
// List travelPosition = [
//   "서울시 강남구 강남동 26-2",
//   "서울시 중구 양재동 80-3",
//   "서울시 송파구 양재동 80-3",
//   "서울시 노원구 양재동 80-3",
//   "서울시 관악구 양재동 80-3",
//   "서울시 종로구 양재동 80-3",
//   "서울시 강북구 양재동 80-3",
//
// ];
// List travelMemo = [
//   "비행장에선 항상 설레인다",
//   "물놀이 중",
//   "석양이 멋지다",
//   "이런 뷰를 어디서 다시 볼 수 있을까",
//   "너무 높히 날아서 간떨어지는 줄",
//   "다시 가고픈 곳",
//   "친구들아 10년뒤 다시 여행하자",
// ];
//
  List travelDiaryTitle = [
    "내 첫 해외여행~~",
    "바다로만 갈꺼야~~",
    "강릉여행 즐거워 즐거워~",
    "경포대여행 즐거워 즐거워~",
    "부산여행 즐거워 즐거워~",
    "제주도여행 즐거워 즐거워~",
    "서울여행 즐거워 즐거워~",
  ];

  List<String> travelDiaryTitleImage = <String>[
    'https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg',
    'http://img.segye.com/content/image/2020/06/16/20200616519515.jpg',
    'https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg',
    'http://img.segye.com/content/image/2020/06/16/20200616519515.jpg',
    'https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg',
  ];
// notifyListeners();

}
