// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/whatsapp_home.dart';

void main() => runApp(const whatsapp());

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
      home: WhatsappHome(),
    );
  }
}
