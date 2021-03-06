import 'package:flutter/material.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';

class Photrast extends StatelessWidget {
  const Photrast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final mediaSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      // 백그라운드 이미지 Container
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/first_bg.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Stack(
                  children: [
                    // 흰 테두리
                    Positioned(
                      top: mediaSize.height / 4,
                      left: (mediaSize.width - 300) / 3,
                      child: Container(
                        height: 300,
                        width: 300,
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          color: Colors.transparent,
                        ),
                        child: Material(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                        top: mediaSize.height / 4 + 50,
                        left: (mediaSize.width - 300) / 3 + 50,
                        child: Text(
                          ' 당신의\n 여행을\n 시작하시겠습니까?',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    // 로고 이미지
                    Positioned(
                        top: mediaSize.height / 4 + 200,
                        left: mediaSize.width / 2 - 20,
                        child: InkWell(
                          onTap: () {
                            var page = context.read<MapViewModel>();
                            page.changePage(1);
                          },
                          child: Image.asset(
                            'assets/logo_img.png',
                            width: 30,
                          ),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
