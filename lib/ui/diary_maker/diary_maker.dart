import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:provider/provider.dart';

class DiaryMaker extends StatefulWidget {
  DiaryMaker({Key? key}) : super(key: key);

  @override
  _DiaryMakerState createState() => _DiaryMakerState();
}

class _DiaryMakerState extends State<DiaryMaker> {
  var myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TestRepository>(context);

    return Scaffold(
      appBar: PhotAppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: myController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "다이어리 제목을 적어주세요",
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: provider.selectedTravelList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Image.asset(
                      provider.selectedTravelList[index]["travelPhotos"],
                      fit: BoxFit.cover,
                      // width: 150,
                      // height: 100,
                    ),
                  );
                },
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

                    // print(provider.travelFolder3);
                    print('실험1:${provider.travelFolder2}');
                    print('실험2:${provider.travelFolder3}');
                    print('실험3:${provider.selectedTravelList}');

                    provider.travelFolder3.clear();
                    // provider.travelFolder3.removeWhere((key, value) => value != null);

                    print('실험3-1:${provider.travelFolder2}');
                    print('실험3-2:${provider.travelFolder3}');
                    provider.travelFolder3["headTitle"]=myController.text;
                    print('실험3-1:${provider.travelFolder2}');
                    print('실험3-2:${provider.travelFolder3}');
                    provider.travelFolder3["contents"]='${provider.selectedTravelList}';
                    print('실험3-1:${provider.travelFolder2}');
                    print('실험3-2:${provider.travelFolder3}');

                    provider.travelFolder2.add(provider.travelFolder3);

                    print('실험4-1:${provider.travelFolder2}');
                    print('실험4-2:${provider.travelFolder3}');
                    print('실험5:${provider.travelFolder2[0]["headTitle"]}');

                    provider.selectedTravelList.clear();
                    // print(provider.selectedTravelList);
                    // print(provider.travelFolder2.length);



                    // provider.travelFolder2.add('{"headTitle" : "${myController.text}", "contents" : ${provider.selectedTravelList}}');
                    // print('${provider.travelFolder2[0].toString()}');
                    // print(provider.travelFolder2[0].toString());
                    // print(provider.travelFolder2[0].);

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
    );
  }
}
