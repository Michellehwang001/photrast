import 'package:flutter/material.dart';
import 'package:project/ui/diary_folder/diary_list.dart';
import 'package:project/ui/kakao_map/map_init.dart';
import 'diary_maker/diary_timeLine.dart';

class PhotDrawer extends StatelessWidget {
  const PhotDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapInit(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Diary Time Line'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiaryTimeLine(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day_outlined),
            title: Text('Diary'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiaryList()),
              );
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
