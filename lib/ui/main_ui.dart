import 'package:flutter/material.dart';
import 'package:project/ui/diary_folder/diary_list.dart';
import 'package:project/ui/diary_maker/diary_timeLine.dart';
import 'package:project/ui/kakao_map/map_init.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:project/ui/phot_drawer.dart';
import 'package:project/ui/photrast.dart';
import 'package:project/util/camera_app.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';

class MainUi extends StatelessWidget {
  MainUi({Key? key}) : super(key: key);

  final List _pages = [
    Photrast(),
    CameraApp(),
    MapInit(),
    DiaryTimeLine(),
    DiaryList()
  ];

  @override
  Widget build(BuildContext context) {
    var page = context.watch<MapViewModel>();

    // PlceView
    return Scaffold(
        appBar: PhotAppBar(),
        body:_pages[page.selectedPage],
        drawer: PhotDrawer(),
    );
  }
}
