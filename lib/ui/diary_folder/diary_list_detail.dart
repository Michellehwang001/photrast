import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/diary_maker/diary_detail.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:provider/provider.dart';

class DiaryListDetail extends StatefulWidget {
  const DiaryListDetail(
      {Key? key, required this.indexDiaryList2DiaryListDetail})
      : super(key: key);

  final indexDiaryList2DiaryListDetail;

  @override
  _DiaryListDetailState createState() => _DiaryListDetailState();
}

class _DiaryListDetailState extends State<DiaryListDetail> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TestRepository>(context);

    return Scaffold(
      appBar: PhotAppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                  'Diary Title : ${provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]
                      ["headTitle"]}',style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)),
          ListView.builder(
            itemCount: provider
                .travelFolder2[widget.indexDiaryList2DiaryListDetail]
                    ["contents"]
                .length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 167,
                      // padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset('assets/logo_line2.png',
                          height: 167, fit: BoxFit.contain),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiaryDetail(
                              travelPhotos: provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelPhotos"],
                              travelTime: provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelTime"],
                              travelPosition: provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]
                              ["travelPosition"],
                              travelMemo: provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelMemo"],
                              index: index,
                            ),
                          ),
                        );
                        // print('diary_timeline 실험 : ${provider.data[index]["travelMemo"]}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          // 'assets/example1.jpg',
                          provider.travelFolder2[
                                  widget.indexDiaryList2DiaryListDetail]
                              ["contents"][index]["travelPhotos"],
                          fit: BoxFit.cover,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelTime"]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              '${provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelPosition"]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              '${provider.travelFolder2[widget.indexDiaryList2DiaryListDetail]["contents"][index]["travelMemo"]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
