import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:provider/provider.dart';

class DiaryDetail extends StatelessWidget {
  const DiaryDetail({Key? key, required this.travelPhotos, required this.travelTime, required this.travelPosition,required this.travelMemo, required this.index }) : super(key: key);

  final travelPhotos;
  final travelTime;
  final travelPosition;
  final travelMemo;
  final index;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TestRepository>(context);
    final myController = TextEditingController();
    print('$index');


    return Scaffold(
      appBar: PhotAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                // 'assets/example1.jpg',
                travelPhotos,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Diary 작성',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              // '일시 : 2021년 7월 3일 PM 1:30',
                travelTime,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              // '장소 : 서울시 강남구 강남동 강남대로 128',
              travelPosition,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: TextField(
                onChanged: (value) {
                  // print('실험하는 중! : 입력된 텍스트는 $value');
                },
                controller: myController,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "사진에 대한 설명을 메모해주세요",
                  hintText: '$travelMemo',



                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '작성 취소',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {

                      provider.data[index]["travelMemo"]=myController.text;
                      Navigator.pop(context);
                    },
                    color: Colors.blue,
                    child: Text(
                      '저장 하기',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
