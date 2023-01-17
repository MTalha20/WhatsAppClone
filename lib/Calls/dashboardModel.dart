import 'package:flutter/material.dart';
import 'package:whatsappclone/Calls/callHistory.dart';

class CallTile extends StatelessWidget {
  const CallTile(this.image, this.name, this.time);

  final String image;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        
        leading: CircleAvatar(
          radius: 25,
          foregroundImage: AssetImage(image),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.call_received,
              size: MediaQuery.of(context).size.height * 0.02,
              color: Colors.green,
            ),
            SizedBox(
              width: 5,
            ),
            Text(time)
          ],
        ),
        trailing: Icon(
          Icons.call,
          color: Color(0xff128C7E),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserCall(name, image, time)));
        },
      ),
    );
  }
}
