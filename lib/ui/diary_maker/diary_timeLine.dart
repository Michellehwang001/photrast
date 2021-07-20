import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/diary_maker/diary_detail.dart';
import 'package:project/ui/diary_maker/diary_maker.dart';
import 'package:provider/provider.dart';

class DiaryTimeLine extends StatefulWidget {
  const DiaryTimeLine({Key? key}) : super(key: key);

  @override
  _DiaryTimeLineState createState() => _DiaryTimeLineState();
}

class _DiaryTimeLineState extends State<DiaryTimeLine> {
  bool isSelectionMode = false;
  // Map<int, bool> selectedFlag = {};

//실험 7/20 : 지역변수 vs 전역변수. 이런 로직(clear)에서는 지역으로 쓰는게 맞다!


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TestRepository>(context);
    // var provider = context.watch<TestRepository>();
    // List<Map> staticData = provider.data;

    List selectedTravelList = [];

    return Scaffold(
      body: ListView.builder(
        itemCount: provider.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Map data = staticData[index];
          // selectedFlag[index] = selectedFlag[index] ?? false;
          dynamic isSelected = provider.data[index]['selectedFlag'];

          return
              // GestureDetector(
              // onLongPress: () => onLongPress(isSelected, index),
              // onTap: () => onTap(isSelected, index),

              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DiaryDetail(
              //         travelPhotos: provider.data[index]["travelPhotos"],
              //         travelTime: provider.data[index]["travelTime"],
              //         travelPosition: provider.data[index]["travelPosition"],
              //         travelMemo: provider.data[index]["travelMemo"],
              //         index: index,
              //       ),
              //     ),
              //   );
              //   print('실험하는 중! : ${provider.data[index]["travelMemo"]}');
              // },
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 167,
                      // padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildSelectIcon(isSelected, index),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiaryDetail(
                              travelPhotos: provider.data[index]["travelPhotos"],
                              travelTime: provider.data[index]["travelTime"],
                              travelPosition: provider.data[index]
                                  ["travelPosition"],
                              travelMemo: provider.data[index]["travelMemo"],
                              index: index,
                            ),
                          ),
                        );
                        print('diary_timeline 실험 : ${provider.data[index]["travelMemo"]}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          // 'assets/example1.jpg',
                          provider.data[index]["travelPhotos"],
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
                              '${provider.data[index]["travelTime"]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              '${provider.data[index]["travelPosition"]}',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if (!isSelectionMode) {
              isSelectionMode = true;
              // print('실험하는 중! : ${provider.selectedTravelList}');
            } else {
              provider.data.map((e) {
                return e['selectedFlag']

//                실험 7/20
//                     ? provider.selectedTravelList.add(e)
                    ? selectedTravelList.add(e)
                    : null;
              }).toList();

              provider.data.removeWhere((e) => e['selectedFlag']);

              print('실험 diary_timeline : $selectedTravelList');
              // print('실험하는 중! : ${provider.data}');
              // provider.data.removeAt(2);
              // print('실험하는 중! : ${provider.data}');

              // provider.data.map((e) {
              //   return e['selectedFlag']
              //       ? provider.data.remove(e)
              //       : null;
              // }).toList();


              // provider.data.remove(provider.data[0]);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DiaryMaker(selectedTravelList: selectedTravelList);
                  },
                ),
              );
              isSelectionMode = false;
              // print('${provider.travelFolder3["headTitle"]}');

              // print('실험하는 중! : ${provider.selectedTravelList}');

            }
          });
        },
        label: isSelectionMode? Text('선택완료'):Text('Diary 만들기'),
        backgroundColor: isSelectionMode? Colors.red: Colors.tealAccent[500],
      ),
    );
  }

  Widget buildSelectIcon(bool isSelected, int index) {
    if (isSelectionMode) {
      var provider = Provider.of<TestRepository>(context);
      return InkWell(
        onTap: () {
          setState(() {
            provider.data[index]['selectedFlag'] = !isSelected;
            // isSelectionMode = selectedFlag.containsValue(true);
            // isSelected= !isSelected;
            // print('실험하는 중! : ${selectedFlag[0]}, ${selectedFlag[1]}');
          });
        },
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: Theme.of(context).primaryColor,
        ),
      );
    } else {
      return Image.asset('assets/logo_line2.png',
          height: 167, fit: BoxFit.contain);
    }
  }

// void onLongPress(bool isSelected, int index) {
//   setState(() {
//     selectedFlag[index] = !isSelected;
//     isSelectionMode = selectedFlag.containsValue(true);
//   });
// }

}
