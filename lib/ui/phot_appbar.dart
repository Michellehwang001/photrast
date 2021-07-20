import 'package:flutter/material.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';

class PhotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PhotAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'PHOTRAST',
        style: Theme
            .of(context)
            .textTheme
            .headline2,
      ),
      actions: [
        IconButton(
            onPressed: () {
              var page = context.read<MapViewModel>();
              page.changePage(1);
            },

            icon: Icon(
              Icons.camera_alt,
              color: Color(0xFFD7EFEF),
            )),
      ],
      iconTheme: IconThemeData(color: Color(0xFFD7EFEF)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

}
