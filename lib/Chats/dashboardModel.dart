import 'package:flutter/material.dart';
import 'message.dart';
import 'dashboard.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            Icons.chat,
            color: Colors.white,
          ),
        )),
      ]),
      body: Column(children: [
        // chattile(),
        chattile(
            "Person1", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile(
            "Person2", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile(
            "Person3", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile(
            "Person4", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile(
            "Person5", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile(
            "Person6", "Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
      ]),
    );
  }
}
