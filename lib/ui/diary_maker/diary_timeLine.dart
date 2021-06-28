import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/diary_maker/diary_detail.dart';
import 'package:project/ui/diary_maker/diary_maker.dart';
import 'package:project/ui/phot_appbar.dart';

class DiaryTimeLine extends StatelessWidget {
  const DiaryTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotAppBar(),
      body: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryDetail(),));            },
            child: Container(
              height: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      'assets/logo_line2.png',
                      height: 200,
                      fit: BoxFit.contain

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/first_bg.jpeg',
                      fit: BoxFit.cover,
                      width: 200,
                      height: 180,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2021년 7월 3일 PM 1:30'),
                          Expanded(child: Text('서울시 강남구 강남동 강남대로 128')),
                          Container(
                            color: Colors.blue,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DiaryMaker();
        },),);
      }, label: Text('Diary 만들기')),
    );
  }
}
