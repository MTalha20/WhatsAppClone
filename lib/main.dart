import 'package:flutter/material.dart';
import 'package:whatsappclone/dashboard.dart';
import 'package:whatsappclone/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: splash(),),
    );
  }
}