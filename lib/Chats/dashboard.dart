import 'package:flutter/material.dart';

import 'message.dart';




class chattile extends StatelessWidget {

  chattile(this.title, this.subtitle, this.time, this.image, this.userID);

  var title;
  var subtitle;
  var image;
  var time;
  var userID;

  @override
  Widget build(BuildContext context) {

        return ListTile(      
        leading: GestureDetector(
          onTap: (){
            showDialog(context: (context), builder: (context){return AlertDialog(
            title: Container(
              child: Stack(children: [
                Image.asset(image),
                Positioned(
                  left: 2,
                  right: 0,
                  top: 5,
                  bottom: 0,
                  child: Text(title, style: TextStyle( color: Colors.white)))
              ],)),
            
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Icon(Icons.chat_sharp, color: Colors.green[800],),
              Icon(Icons.call, color: Colors.green[800],),
              Icon(Icons.videocam, color: Colors.green[800],),
              Icon(Icons.info_outline, color: Colors.green[800],),],)
            ],
            );});
          },
          child: CircleAvatar(
          radius: 25,
          foregroundImage: AssetImage(image),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        trailing: Text(time, style: TextStyle(fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserChat(title, image, userID)));
        },
      );
  }}

