import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatelessWidget {
  DiaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    var provider = Provider.of<TestRepository>(context);

    // print('실험하는 중 1,${provider.travelFolder}');
    // print('실험하는 중 2,${provider.travelFolder["items"][0]["contents"][0]["travelPhotos"]}');
    // print('실험하는 중 3,${provider.travelFolder1.length}');
    // print('실험하는 중 4,${provider.travelFolder1[0]["contents"][0]["travelPhotos"]}');
    // print('실험하는 중 5,${provider.travelFolder2[0]["contents"]["travelPhotos"]}');

    int itemColumnLeft = (provider.travelFolder2.length)~/2 +1;
    // print(itemColumnLeft);
    int itemColumnRight = (provider.travelFolder2.length)~/2 ;

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
                      itemCount: provider.travelFolder1.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: index % 2 == 0 ? 110 : 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('${provider.travelFolder1[0]["contents"][0]["travelPhotos"]}'),
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
                                    // '강릉여행 즐거워~ 즐거워~ 줄거워~',
                                    '${provider.travelDiaryTitle[index]}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
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
                      itemCount: provider.travelFolder1.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: index % 2 == 0 ? 150 : 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${provider.travelDiaryTitleImage[index]}'),
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
                                    // '강릉여행 즐거워~ 즐거워~ 줄거워~',
                                    '${provider.travelDiaryTitle[index]}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
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
