import 'package:flutter/material.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:project/ui/phot_drawer.dart';
import 'package:project/util/camera_app.dart';

class MainUi extends StatelessWidget {
  const MainUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotAppBar(),
      body:CameraApp(),
      drawer: PhotDrawer(),
    );
  }
}
