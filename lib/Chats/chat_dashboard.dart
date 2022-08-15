import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'chat_tile.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        
        // chattile(),
        chattile("Person1","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile("Person2","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile("Person3","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile("Person4","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile("Person5","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        chattile("Person6","Can't talk,WhatsApp only", "1:05", "assets/bg.jpg"),
        SizedBox(height: 100),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.chat_rounded,
              color: Colors.white,
              ),),
              SizedBox(width: 10,)],) 
      ]),
    );
  }
}

