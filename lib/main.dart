// ignore_for_file: unnecessary_const

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/CameraScreen.dart';
import 'package:whatsapp_clone/screens/login%20screen.dart';
import 'package:whatsapp_clone/screens/whatsapp_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras =await availableCameras();
  runApp(const whatsapp());
}

// ignore: camel_case_types
class whatsapp extends StatelessWidget {
  const whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Whatsapp",
      // ignore: unnecessary_new
      theme: ThemeData(
        //fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF075E54))
      ),
      home: LoginScreen(),
    );
  }
}
