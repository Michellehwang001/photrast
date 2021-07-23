import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/model/place_info.dart';
import 'package:project/util/kakao_map_api.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:project/viewmodel/place_view_model.dart';
import 'package:provider/provider.dart';

class MapInit extends StatefulWidget {
  const MapInit({Key? key}) : super(key: key);

  @override
  _MapInitState createState() => _MapInitState();
}

class _MapInitState extends State<MapInit> {
  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();
    final placeViewModel = context.watch<PlaceViewModel>();

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Center(
              // Check Map Loading
              child: mapViewModel.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : KakaoMapApi(),
            ),
          ),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.typeID = 12;
                          },
                          child: Text('관광지')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.typeID = 39;
                          },
                          child: Text('식당')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.typeID = 32;
                          },
                          child: Text('숙박')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.typeID = 38;
                          },
                          child: Text('쇼핑')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.rad = 500;
                          },
                          child: Text('500m')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.rad = 1000;
                          },
                          child: Text('1Km')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.rad = 2000;
                          },
                          child: Text('2Km')),
                      ElevatedButton(
                          onPressed: () {
                            placeViewModel.rad= 10000;
                          },
                          child: Text('10Km')),
                    ],
                  ),
                ],
              )),
          Flexible(
            flex: 4,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildItem(placeViewModel.items[index]);
              },
              itemCount: placeViewModel.items.length,
            ),
          ),
          // Button
          // List
        ],
      ),
    );
  }

  Widget buildItem(Item item) {
    return ListTile(
      leading: item.firstimage != null ? Image.network('${item.firstimage}', width: 100,)
              : Image.network('https://images.unsplash.com/photo-1533035353720-f1c6a75cd8ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80', width: 100,),
      title: Text('${item.title}'),
      subtitle: Text('${item.addr1}'),
    );
  }
}
