import 'package:flutter/material.dart';
import 'package:project/ui/diary_maker/diary_timeLine.dart';
import 'package:project/ui/phot_appbar.dart';
import 'package:project/ui/phot_drawer.dart';

class UiTemp extends StatelessWidget {
  const UiTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotAppBar(),
      body: Container(),
      drawer: PhotDrawer(),
    );
  }
}
