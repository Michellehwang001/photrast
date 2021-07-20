import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/diary_folder/diary_list_detail.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatelessWidget {
  DiaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mediaSize = MediaQuery.of(context).size;
    var provider = Provider.of<TestRepository>(context);

    // print('실험하는 중 1 : ${provider.travelFolder}');
    // print('실험하는 중 2 : ${provider
    //     .travelFolder["items"][0]["contents"][0]["travelPhotos"]}');
    // print('실험하는 중 3 : ${provider.travelFolder2.length}개');
    // print('실험하는 중 4 : ${provider.travelFolder1[0]["contents"][0]["travelPhotos"]}');
    // print('실험하는 중 5-1 : ${provider.travelFolder2}');
    // print('실험하는 중 5-2 : ${provider.travelFolder2[0]}');
    // print('실험하는 중 5-3 : ${provider.travelFolder2[0]["contents"]}');
    // print('실험하는 중 5-4 : ${provider.travelFolder2[0]["contents"][0]}');
    // print(
    //     '실험 diary_list 5-5 : ${provider.travelFolder2[0]["contents"][0]["travelPhotos"]}');

    return Scaffold(
      // 전체 스크롤을 주기 위해 SingleChildScrollView 사용
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: provider.travelFolder2.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiaryListDetail(
                            indexDiaryList2DiaryListDetail: index),
                      ),
                    );
                  },
                  child: Container(
                    height: index.isEven ? 100 : 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // image: AssetImage(
                        //     '${provider.travelFolder2[index]["contents"][0]["travelPhotos"]}'),

                        image: provider.travelFolder2[index]["contents"][0]
                                    ["travelPhotos"] ==
                                null
                            ? NetworkImage(
                                    'https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg')
                                as ImageProvider
                            : AssetImage(
                                '${provider.travelFolder2[index]["contents"][0]["travelPhotos"]}'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  children: [
                    Flexible(
                      child: Expanded(
                        child: Text(
                          // '강릉여행~',
                          '${provider.travelFolder2[index]["headTitle"]}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
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
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 1.5 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );

    //   SafeArea(
    //     child: SingleChildScrollView(
    //       child: ConstrainedBox(
    //         constraints: BoxConstraints(
    //           maxHeight: mediaSize.height,
    //         ),
    //         child: Row(
    //           children: [
    //             Container(
    //               width: mediaSize.width ,
    //               child: ListView.builder(
    //                   physics: NeverScrollableScrollPhysics(),
    //                   padding: const EdgeInsets.all(8),
    //                   itemCount: provider.travelFolder2.length,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return Column(
    //                       children: [
    //                         GestureDetector(
    //                           onTap: () {
    //                             Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                 builder: (context) => DiaryListDetail(
    //                                     indexDiaryList2DiaryListDetail: index),
    //                               ),
    //                             );
    //                           },
    //                           child: Container(
    //                             height: index % 2 == 0 ? 110 : 150,
    //                             decoration: BoxDecoration(
    //                               image: DecorationImage(
    //                                 fit: BoxFit.cover,
    //                                 image: AssetImage(
    //                                     '${provider.travelFolder2[index]["contents"][0]["travelPhotos"]}'),
    //
    //                                 // image:
    //                                 // provider.travelFolder2[0]["contents"][0]["travelPhotos"] == null ?
    //                                 // NetworkImage('https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg') as ImageProvider:
    //                                 // AssetImage('${provider.travelFolder2[0]["contents"][0]["travelPhotos"]}'),
    //                                 // Image.network('https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg'),
    //                                 // NetworkImage('https://shopspring.kr/wp-content/uploads/2020/07/%EC%9D%B4%ED%95%98%EC%9D%B4_1.jpg'),
    //                                 // ('${provider.travelDiaryTitleImage[0]}'),
    //                                 // AssetImage('${provider.travelFolder2[0]["contents"][0]["travelPhotos"]}'),
    //                                 // NetworkImage('https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg'),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Row(
    //                             children: [
    //                               Flexible(
    //                                 child: Text(
    //                                   // '강릉여행 즐거워~ 즐거워~ 줄거워~',
    //                                   '${provider.travelFolder2[index]["headTitle"]}',
    //                                   style:
    //                                       Theme.of(context).textTheme.headline4,
    //                                 ),
    //                               ),
    //                               Icon(
    //                                 Icons.share,
    //                                 color: Color(0xFF248B8B),
    //                               ),
    //                               Icon(
    //                                 Icons.favorite,
    //                                 color: Colors.red,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     );
    //                   }),
    //             ),
    //             // Container(
    //             //   width: mediaSize.width / 2,
    //             //   child: ListView.builder(
    //             //       physics: NeverScrollableScrollPhysics(),
    //             //       padding: const EdgeInsets.all(8),
    //             //       itemCount: provider.travelFolder1.length,
    //             //       itemBuilder: (BuildContext context, int index) {
    //             //         return Column(
    //             //           children: [
    //             //             Container(
    //             //               height: index % 2 == 0 ? 150 : 110,
    //             //               decoration: BoxDecoration(
    //             //                 image: DecorationImage(
    //             //                   image: NetworkImage(
    //             //                       '${provider.travelDiaryTitleImage[index]}'),
    //             //                   fit: BoxFit.cover,
    //             //                 ),
    //             //               ),
    //             //             ),
    //             //             Padding(
    //             //               padding: const EdgeInsets.all(8.0),
    //             //               child: Row(
    //             //                 children: [
    //             //                   Flexible(
    //             //                       child: Text(
    //             //                     // '강릉여행 즐거워~ 즐거워~ 줄거워~',
    //             //                     '${provider.travelDiaryTitle[index]}',
    //             //                     style:
    //             //                         Theme.of(context).textTheme.headline4,
    //             //                   )),
    //             //                   Icon(
    //             //                     Icons.share,
    //             //                     color: Color(0xFF248B8B),
    //             //                   ),
    //             //                   Icon(
    //             //                     Icons.favorite,
    //             //                     color: Colors.red,
    //             //                   ),
    //             //                 ],
    //             //               ),
    //             //             ),
    //             //           ],
    //             //         );
    //             //       }),
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
