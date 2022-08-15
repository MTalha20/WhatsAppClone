import 'package:flutter/material.dart';
import 'calls_tile.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CallTile("assets/bg.jpg", "Person1", "Yesterday, 12:01"),
          CallTile("assets/bg.jpg", "Person2", "Yesterday, 12:01"),
          CallTile("assets/bg.jpg", "Person3", "Yesterday, 12:01"),
          CallTile("assets/bg.jpg", "Person4", "Yesterday, 12:01"),
          CallTile("assets/bg.jpg", "Person5", "Yesterday, 12:01"),
          CallTile("assets/bg.jpg", "Person6", "Yesterday, 12:01"),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                child: Icon(Icons.add_call, color: Colors.white,),),
                SizedBox(width: 10,),
            ],
          )
          ],
      ),
    );
  }
}

