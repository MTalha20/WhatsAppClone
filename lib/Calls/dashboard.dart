import 'package:flutter/material.dart';
import 'dashboardModel.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
            child: FloatingActionButton(
          backgroundColor: Color(0xff128C7E),
          onPressed: () {},
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        )),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CallTile("assets/bg.jpg", "Person1", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person2", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person3", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person4", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person5", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person6", "Yesterday, 12:01"),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
