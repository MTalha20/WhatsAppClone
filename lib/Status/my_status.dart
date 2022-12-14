import 'package:flutter/material.dart';

class MyStatus extends StatelessWidget {
  const MyStatus({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(        
            radius: 27,  
            foregroundImage: AssetImage("assets/bg.jpg")),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: MediaQuery.of(context).size.height*0.015,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: MediaQuery.of(context).size.height*0.02,
              ),))
      ],
    );
  }
}