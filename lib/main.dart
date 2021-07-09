// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:project/repository/test_repository.dart';
// import 'package:project/ui/diary_folder/diary_list.dart';
// import 'package:project/ui/diary_maker/diary_maker.dart';
// import 'package:project/ui/diary_maker/diary_timeLine.dart';
// import 'package:project/ui/kakao_map/map_init.dart';
// import 'package:project/ui/phot_appbar.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:project/ui/ui_temp.dart';
// import 'package:project/util/camera_app.dart';
// import 'package:provider/provider.dart';
// import 'package:project/viewmodel/map_view_model.dart';
//
// Future<void> main() async {
//   // Fetch the available cameras before initializing the app.
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     logError(e.code, e.description);
//   }
//   runApp(MultiProvider(
//       providers: [
//         ChangeNotifierProvider<TestRepository>(
//           create: (context) => TestRepository(),
//         ),
//         ChangeNotifierProvider(create: (_) => MapViewModel()),
//       ],
//       child: MyApp()));
// }
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primaryColor: Color(0xFF63C0C2),
//         accentColor: Color(0xFF48AAAC),
//         fontFamily: 'Georgia',
//         textTheme: TextTheme(
//           headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//           headline2: TextStyle(
//               fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//           headline3: TextStyle(
//               fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
//           headline4: TextStyle(
//               fontSize: 18.0, color: Color.fromRGBO(82, 82, 82, 1)),
//           headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//           bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//         ),
//       ),
//       home: Photrast(),
//     );
//   }
// }
//
// class Photrast extends StatelessWidget {
//   const Photrast({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaSize = MediaQuery
//         .of(context)
//         .size;
//
//     return Scaffold(
//       appBar: PhotAppBar(),
//       // 백그라운드 이미지 Container
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/first_bg.jpeg'),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: Stack(
//                   children: [
//                     // 흰 테두리
//                     Positioned(
//                       top: mediaSize.height / 4,
//                       left: (mediaSize.width - 300) / 3,
//                       child: Container(
//                         height: 300,
//                         width: 300,
//                         padding: const EdgeInsets.all(8.0),
//                         margin: const EdgeInsets.all(20.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2, color: Colors.white),
//                           color: Colors.transparent,
//                         ),
//                         child: Material(
//                           color: Colors.transparent,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                         top: mediaSize.height / 4 + 50,
//                         left: (mediaSize.width - 300) / 3 + 50,
//                         child: Text(
//                           ' 당신의\n 여행을\n 시작하시겠습니까?',
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         )),
//                     // 로고 이미지
//                     Positioned(
//                         top: mediaSize.height / 4 + 200,
//                         left: mediaSize.width / 2 - 20,
//                         child: InkWell(
//                           onTap: () =>
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) =>
//                                     UiTemp()),
//                               ),
//                           child: Image.asset(
//                             'assets/logo_img.png',
//                             width: 30,
//                           ),
//                         )),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//



// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Path Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Directory?>? _tempDirectory;
  Future<Directory?>? _appSupportDirectory;
  Future<Directory?>? _appLibraryDirectory;
  Future<Directory?>? _appDocumentsDirectory;
  Future<Directory?>? _externalDocumentsDirectory;
  Future<List<Directory>?>? _externalStorageDirectories;
  Future<List<Directory>?>? _externalCacheDirectories;

  void _requestTempDirectory() {
    setState(() {
      _tempDirectory = getTemporaryDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
        snapshot.data!.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  void _requestAppDocumentsDirectory() {
    setState(() {
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
    });
  }

  void _requestAppSupportDirectory() {
    setState(() {
      _appSupportDirectory = getApplicationSupportDirectory();
    });
  }

  void _requestAppLibraryDirectory() {
    setState(() {
      _appLibraryDirectory = getLibraryDirectory();
    });
  }

  void _requestExternalStorageDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void _requestExternalStorageDirectories(StorageDirectory type) {
    setState(() {
      _externalStorageDirectories = getExternalStorageDirectories(type: type);
    });
  }

  void _requestExternalCacheDirectories() {
    setState(() {
      _externalCacheDirectories = getExternalCacheDirectories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Temporary Directory'),
                onPressed: _requestTempDirectory,
              ),
            ),
            FutureBuilder<Directory?>(
                future: _tempDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Documents Directory'),
                onPressed: _requestAppDocumentsDirectory,
              ),
            ),
            FutureBuilder<Directory?>(
                future: _appDocumentsDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Support Directory'),
                onPressed: _requestAppSupportDirectory,
              ),
            ),
            FutureBuilder<Directory?>(
                future: _appSupportDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Library Directory'),
                onPressed: _requestAppLibraryDirectory,
              ),
            ),
            FutureBuilder<Directory?>(
                future: _appLibraryDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text(Platform.isIOS
                    ? 'External directories are unavailable on iOS'
                    : 'Get External Storage Directory'),
                onPressed:
                Platform.isIOS ? null : _requestExternalStorageDirectory,
              ),
            ),
            FutureBuilder<Directory?>(
                future: _externalDocumentsDirectory, builder: _buildDirectory),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text(Platform.isIOS
                      ? 'External directories are unavailable on iOS'
                      : 'Get External Storage Directories'),
                  onPressed: Platform.isIOS
                      ? null
                      : () {
                    _requestExternalStorageDirectories(
                      StorageDirectory.music,
                    );
                  },
                ),
              ),
            ]),
            FutureBuilder<List<Directory>?>(
                future: _externalStorageDirectories,
                builder: _buildDirectories),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text(Platform.isIOS
                      ? 'External directories are unavailable on iOS'
                      : 'Get External Cache Directories'),
                  onPressed:
                  Platform.isIOS ? null : _requestExternalCacheDirectories,
                ),
              ),
            ]),
            FutureBuilder<List<Directory>?>(
                future: _externalCacheDirectories, builder: _buildDirectories),
          ],
        ),
      ),
    );
  }
}