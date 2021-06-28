import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Photrast(),
    );
  }
}

class Photrast extends StatelessWidget {
  const Photrast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Background Image

                Expanded(
                    child: Container(
                        child: Image.asset(
                  'assets/first_bg.jpeg',
                  fit: BoxFit.fill,
                ))),
                // Container(
                //   height: 300,
                //   width: 300,
                //   padding: const EdgeInsets.all(8.0),
                //   margin: const EdgeInsets.all(20.0),
                //   decoration: BoxDecoration(
                //     border: Border.all(width: 1),
                //     color: Colors.transparent,
                //   ),
                //   // child: Material( colo
                //   // ),
                // ),

          ],
        ),
      ),
    );
  }
}
