import 'package:flutter/material.dart';

class UserCall extends StatelessWidget {
  const UserCall(this.name, this.image, this.time);

  final String name;
  // final String description;
  final String image;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        leading: GestureDetector(
          onTap: (){Navigator.of(context).pop();},
          child: Icon(Icons.arrow_back)),
        title: Text(
          "Call info",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [Icon(Icons.message_rounded),
        SizedBox(width: 10,), 
        Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Container(
          child: ListTile(
          leading: CircleAvatar(foregroundImage: AssetImage(image),),
          title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.call, color: Color(0xff128C7E),),
          ),
          ),
          Container(
          child: ListTile(
          title: Text("Yesterday"),
          ),
          ),
          Container(
          child: ListTile(
          leading: Icon(Icons.call_received_outlined, color: Colors.green,),
          title: Text("Incoming"),
          subtitle: Text(time),
          ),
          ),
        ],
      )
      
    );
  }
}
