import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/test_repository.dart';
import 'package:project/ui/main_ui.dart';
import 'package:project/util/camera_app.dart';
import 'package:project/viewmodel/map_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TestRepository>(
      create: (context) => TestRepository(),
    ),
    ChangeNotifierProvider<MapViewModel>(
      create: (context) => MapViewModel(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF63C0C2),
        accentColor: Color(0xFF48AAAC),
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline4:
              TextStyle(fontSize: 18.0, color: Color.fromRGBO(82, 82, 82, 1)),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MainUi(),
    );
  }
}

