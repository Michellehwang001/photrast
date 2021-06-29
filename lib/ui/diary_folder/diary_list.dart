import 'package:flutter/material.dart';
import 'package:project/ui/phot_appbar.dart';

class DiaryList extends StatelessWidget {
  DiaryList({Key? key}) : super(key: key);
  final List<String> entries = <String>[
    'https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg',
    'http://img.segye.com/content/image/2020/06/16/20200616519515.jpg',
    'https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg',
    'http://img.segye.com/content/image/2020/06/16/20200616519515.jpg',
    'https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PhotAppBar(),
      // 전체 스크롤을 주기 위해 SingleChildScrollView 사용
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: mediaSize.height,
            ),
            child: Row(
              children: [
                Container(
                  width: mediaSize.width / 2,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: index % 2 == 0 ? 110 : 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${entries[index]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                    '강릉여행 즐거워~ 즐거워~ 줄거워~',
                                    style: Theme.of(context).textTheme.headline4,
                                  )),
                                  Icon(
                                    Icons.share,
                                    color: Color(0xFF248B8B),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Container(
                  width: mediaSize.width / 2,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: index % 2 == 0 ? 150 : 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${entries[index]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                    '강릉여행 즐거워~ 즐거워~ 줄거워~',
                                    style: Theme.of(context).textTheme.headline4,
                                  )),
                                  Icon(
                                    Icons.share,
                                    color: Color(0xFF248B8B),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
