import 'package:flutter/material.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';

class PhotDrawer extends StatelessWidget {
  const PhotDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var page = context.watch<MapViewModel>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF54C4C7),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cphoto.asiae.co.kr/listimglink/6/2020072310235476451_1595467435.jpeg'),
                  maxRadius: 50.0,
                ),
                Text(
                  'HiHi@gmail.com',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Map'),
            onTap: () {
              page.changePage(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Diary Time Line'),
            onTap: () {
              page.changePage(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day_outlined),
            title: Text('Diary'),
            onTap: () {
              page.changePage(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ],
      ),
    );
  }
}
