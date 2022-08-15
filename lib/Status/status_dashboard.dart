import 'package:flutter/material.dart';
import 'my_status.dart';
import 'other_status.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
            leading: MyStatus(),
            title: Text("My status", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Tap to add status updates"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text("  Recent Updates", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            OtherStatus("Person1","Today, 12:01"),
            OtherStatus("Person2","Today, 12:01"),
            OtherStatus("Person3","Today, 12:01"),
            SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(children: [
                  CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[400],
                  child: Icon(Icons.edit, color: Colors.grey[850])),
                  SizedBox(height: 10),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.camera_alt, color: Colors.white,)),
                  
                ],),
                SizedBox(width: 10,)
              ],
            )
          ],
        ),
        
      )
      
    );
  }
}





