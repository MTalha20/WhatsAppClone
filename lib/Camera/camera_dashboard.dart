import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappclone/sharedData.dart';

class Camera extends StatefulWidget {
  const Camera({ Key? key }) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  @override
  void initState() {
    var screen = Provider.of<Screen>(context, listen: false);
    screen.changeScreenVal(0);
    print("Screen " + screen.getScreenVal().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(7) 
                    ),
                    child: Icon(Icons.groups_rounded, color: Colors.white, size: 30,),
                    ),
                    Positioned(
                      right: -1,
                      bottom: -1,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 10,
                        child: Icon(Icons.add, color: Colors.white, size: 15,),),
                    )
                  ],
                ),
              SizedBox(width: 10,),
              Text("New Community", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)  
              ],
            ),
            SizedBox(height: 10,),
            Row()
          ],
        ),
      ),
    );
  }
}