import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappclone/mainPage.dart';
import 'package:whatsappclone/sharedData.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => 
            ChangeNotifierProvider(
              create: (context) => Screen(),
              child: Dashboard()))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(""),
            Image.asset("assets/pngegg.png", height: 80, width: 90),
            Container(
              child: Column(
                children: [
                  Text(
                    "from",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text("Meta",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
