import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter/material.dart';
import 'messageModel.dart';

class UserChat extends StatefulWidget {
  
  final String name;
  final String image;
  final String userID;

  const UserChat(this.name, this.image, this.userID);
  
  @override

  State<UserChat> createState() => _UserChatState();
}

ScrollController scroll = ScrollController();
TextEditingController messagecontroller = TextEditingController();


class _UserChatState extends State<UserChat> {
 

DatabaseReference messageRef = FirebaseDatabase.instance.ref("messages");

write()async{
  
  DatabaseReference newMessageRef = messageRef.push();

  try {
    await newMessageRef.set({
  
       "message": messagecontroller.text,
       "dateTime": DateTime.now().toString(),
       "sender": myID,
       "receiver": widget.userID,
       "key": newMessageRef.key,
  });

  print("Message added DB");

  } catch (e) {
    print("Error in  DB");
    print(e.toString());
  }
}

List items = [];
var myID = "03222563023";
List <Message> chats = [];
get()async{
  
  try{

  var refrence =  await FirebaseDatabase.instance.ref("messages");
  refrence.onChildAdded.listen((event){ 
  var data = event.snapshot;
  chats.add(Message(
  text: data.child("message").value.toString(), 
  date: DateTime.parse(data.child("dateTime").value.toString()), 
  Sender: true));
  print(data.child("message").value.toString());
  print(data.child("dateTime").value.toString());
  print(data.child("sender").value.toString());

  });
    
    print(chats);
    print("Data Fetched Form DB");
   
  } 
  
  catch (e) {
    print(e.toString());
    print("error in getting messages from DB");
  } 
 
}

var input = "";

@override

void initState(){
  get();
  super.initState();
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  )),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                foregroundImage: AssetImage(widget.image),
                radius: 15,
              ),
            ],
          ),
          title: Text(widget.name),
          actions: [
            Icon(Icons.videocam),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.call),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color(0xff128C7E),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffECE5DD),
          child: Column(children: [
            Expanded(
              flex: 100,
              // child: Container(),
              child: conversations(context),
            ),
            Flexible(
              flex: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                  width: MediaQuery.of(context).size.width*0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50) 
                    ), 
                    child: buildTextfield()),
                    SizedBox(width: 5,),
                    CircleAvatar(radius: 23,
                    backgroundColor: Color(0xff128C7E),
                    child: GestureDetector(
                      onTap: () {
                        // final messages = Message(text: messagecontroller.text, date: DateTime.now(), Sender: true);
                          if (messagecontroller.text != "") {
                              write();
                              messagecontroller.clear();
                            
                          }
                      },
                      child: input == "" ? Icon(Icons.keyboard_voice, color: Colors.white): Icon(Icons.send, color: Colors.white,)),
                    ),
                  ],
                )
              ),
            )
          ]),
        ));
  }


Widget buildTextfield() {
  return Scrollbar(
    controller: scroll,
    isAlwaysShown: true,
    child: TextField(
        onChanged: (value){
          setState(() {
            input = value;
          });
        },
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: messagecontroller,
        cursorColor: Colors.green,
        scrollController:  scroll,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(12),
          filled: true,
          border: InputBorder.none,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.emoji_emotions_rounded,
            color: Colors.grey[800],
          ),
          suffixIcon: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              )),
          hintText: "Message",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
        ),
        ),
  );
}


Widget conversations(context){
  return GroupedListView<Message, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: EdgeInsets.all(8),
                elements: chats, 
                groupBy: (chats) => DateTime(
                  chats.date.year,
                  chats.date.month,
                  chats.date.day,
                ),
                groupHeaderBuilder: (Message chats) => SizedBox(
                  height: 37,
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(DateFormat.yMMMd().format(chats.date), style: TextStyle(color: Colors.grey[800], fontSize: 10)),
                        ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message chats) => 
                  Align(
                    alignment: chats.Sender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Container(
                        // width: MediaQuery.of(context).size.width*0.3,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: chats.Sender ? Color(0xffDCF8C6) : Colors.white,
                        ),
                        child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: chats.text, style: TextStyle(color: Colors.black)),
                            TextSpan(text: "    ", style: TextStyle(color: Colors.black)),
                            TextSpan(text: DateFormat("HH:mm").format(chats.date), style: TextStyle(fontSize: 10, color: Colors.black))
                          ]
                        )),
                        // child: Text(chats.text),  
                      ),
                    ),
                  ),
                );
}

}



