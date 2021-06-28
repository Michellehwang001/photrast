import 'package:flutter/material.dart';

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
                      'https://lh3.googleusercontent.com/proxy/7ElGQDW8GGGHJ1I8G0JcowGQpMQLHWU-iFYmLf_9yRCcY3kMQqjyJ0Xy0iw_6japNauEcQAbYAsw55RwAT0YAKiYIm2rBp0Fs25U4e3X_3Lk6skEY3QoRktZFcaUMoaHTT2up72kfLW_XQ'),
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
          ),
          ListTile(
            leading: Icon(Icons.timeline),
            title: Text('TimeLine'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day_outlined),
            title: Text('Diary'),
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
