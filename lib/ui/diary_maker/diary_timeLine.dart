import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/diary_maker/diary_detail.dart';
import 'package:project/ui/diary_maker/diary_maker.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:provider/provider.dart';

class DiaryTimeLine extends StatelessWidget {
  const DiaryTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TestRepository>(context);
    var provider = context.watch<TestRepository>();
    return Scaffold(
      appBar: PhotAppBar(),
      body: ListView.builder(
        itemCount: provider.travelPhotos.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiaryDetail(),
                ),
              );
            },
            child: Expanded(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset('assets/logo_line2.png',
                          height: 200, fit: BoxFit.contain),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        // 'assets/example1.jpg',
                        provider.travelPhotos[index],
                        fit: BoxFit.cover,
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${provider.travelTime[index]}', maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: false,),
                            Text('${provider.travelPosition[index]}', maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: false,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DiaryMaker();
                },
              ),
            );
          },
          label: Text('Diary 만들기')),
    );
  }
}
