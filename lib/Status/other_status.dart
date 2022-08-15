import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  
  const OtherStatus(this.name, this.time);

  final String name;
  final String time; 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: 
            CircleAvatar(
              radius: MediaQuery.of(context).size.height*0.031,
              backgroundColor: Colors.green,
            child: CircleAvatar(
              foregroundImage: AssetImage("assets/bg.jpg")),
            ),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(time, style: TextStyle(fontWeight: FontWeight.bold),),
          ),]          
          )  
      );
  }
}

