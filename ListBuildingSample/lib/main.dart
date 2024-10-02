/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';

import 'home/view/camera_screen.dart';
import 'home/view/home_screen.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScanditFlutterDataCaptureBarcode.initialize();
  cameras = await availableCameras();

  // Lock orientation to portrait
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ListBuildingSample',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              color: Colors.black,
              titleTextStyle: TextStyle(color: Colors.white)),
        ),
        home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen('SparkScan'),
                  ),
                );
              },
              child: Text('Open SparkScan Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CameraApp(),
                  ),
                );
              },
              child: Text('Open Camera Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
