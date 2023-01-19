import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappclone/sharedData.dart';
import 'message.dart';


class chattile extends StatefulWidget {

  chattile(this.title, this.subtitle, this.time, this.image, this.userID);

  var title;
  var subtitle;
  var image;
  var time;
  var userID;

  @override
  State<chattile> createState() => _chattileState();
}

class _chattileState extends State<chattile> {

  @override
  void initState() {
    var screen = Provider.of<Screen>(context, listen: false);
    screen.changeScreenVal(1);
    print("Screen " + screen.getScreenVal().toString());
  }


  @override
  Widget build(BuildContext context) {
        return ListTile(      
        leading: GestureDetector(
          onTap: (){
            showDialog(context: (context), builder: (context){return AlertDialog(
            title: Container(
              child: Stack(children: [
                Image.asset(widget.image),
                Positioned(
                  left: 2,
                  right: 0,
                  top: 5,
                  bottom: 0,
                  child: Text(widget.title, style: TextStyle( color: Colors.white)))
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
          foregroundImage: AssetImage(widget.image),
          ),
        ),
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(widget.subtitle),
        trailing: Text(widget.time, style: TextStyle(fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserChat(widget.title, widget.image, widget.userID)));
        },
      );
  }}

