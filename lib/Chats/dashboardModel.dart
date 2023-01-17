import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:firebase_database/firebase_database.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override

  // void initState(){
  //   super.initState();
  // }

  final ref = FirebaseDatabase.instance.ref();
 

  writeData()async{
    await ref.child("chats-03222563023/032325334").set({
      "title": "usman",
      "description": "broken", 
  });
  print("Database Added");
  }

  getData()async{
    final snapshot = await ref.child('chats-03222563023').get();
    if (snapshot.exists) {
      print("data available");
      print(snapshot.key);
    } else {
      print('No data available.');
    }
  }
  

  var userlist = [
    {
      'title': 'Bilal',
      'subtitle': 'Busy',
      'time': '1:05',
      'image': 'assets/bg.jpg'
    },
    {
      'title': 'Ahmed',
      'subtitle': 'At Work',
      'time': '4:33',
      'image': 'assets/bg1.jpg'
    },
    {
      'title': 'Asim',
      'subtitle': 'Blessed',
      'time': '3:01',
      'image': 'assets/bg2.jpg'
    },
    {
      'title': 'Harris',
      'subtitle': 'Available',
      'time': '7:45',
      'image': 'assets/bg3.jpg'
    },
    {
      'title': 'Study Group',
      'subtitle': 'sytem.out.println("Invalid")',
      'time': '18:05',
      'image': 'assets/bg4.jpg'
    },
  ];


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
      body:
      FirebaseAnimatedList(
        query: ref.child('chats-03222563023'),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          return chattile(
            snapshot.child('title').value.toString(), 
            snapshot.child('description').value.toString(), 
            userlist[index]['time'], 
            userlist[index]['image'],
            snapshot.key.toString(),
            );
        },) 
    );
  }
}



  