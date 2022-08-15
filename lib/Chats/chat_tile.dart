import 'package:flutter/material.dart';

import 'chat_message.dart';

var userlist = [
{'title': 'Bilal', 'subtitle': 'Busy', 'time': '1:05', 'image': 'assets/bg.jpg' },
{'title': 'Ahmed', 'subtitle': 'At Work', 'time': '4:05', 'image': 'assets/bg.jpg' },
{'title': 'Ali', 'subtitle': 'Blessed', 'time': '3:05', 'image': 'assets/bg.jpg' }
];


class chattile extends StatelessWidget {

  chattile(this.title, this.subtitle, this.time, this.image);

  String title;
  String subtitle;
  String image;
  String time;

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
          foregroundImage: AssetImage(image),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        trailing: Text(time, style: TextStyle(fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserChat(title, image)));
        },
      );
  }}


// class chattile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: userlist.length,
//         itemBuilder: (context, i){
//           return ListTile(      
//           leading: GestureDetector(
//             onTap: (){
//               showDialog(context: (context), builder: (context){return AlertDialog(
//               title: Container(
//                 child: Stack(children: [
//                   Image.asset(userlist[i]['image']!),
//                   Positioned(
//                     left: 2,
//                     right: 0,
//                     top: 5,
//                     bottom: 0,
//                     child: Text(userlist[i]['title']!, style: TextStyle( color: Colors.white)))
//                 ],)),
              
//               actions: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                 Icon(Icons.chat_sharp, color: Colors.green[800],),
//                 Icon(Icons.call, color: Colors.green[800],),
//                 Icon(Icons.videocam, color: Colors.green[800],),
//                 Icon(Icons.info_outline, color: Colors.green[800],),],)
//               ],
//               );});
//             },
//             child: CircleAvatar(
//             foregroundImage: AssetImage(userlist[i]['image']!),
//             ),
//           ),
//           title: Text(userlist[i]['title']!, style: TextStyle(fontWeight: FontWeight.bold),),
//           subtitle: Text(userlist[i]['subtitle']!),
//           trailing: Text(userlist[i]['time']!, style: TextStyle(fontWeight: FontWeight.bold),),
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserChat(userlist[i]['title']!, userlist[i]['image']!)));
//           },
//         );
//         }),
//     );  
//   }
// }


