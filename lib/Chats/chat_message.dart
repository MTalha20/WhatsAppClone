import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter/material.dart';
import 'MessageModel.dart';

class UserChat extends StatefulWidget {
  final String name;
  final String image;

  const UserChat(this.name, this.image);

  @override
  State<UserChat> createState() => _UserChatState();
}

TextEditingController messagecontroller = TextEditingController();
List<Message>message = [
  Message(text: "Yeah be Quick", date: DateTime.now().subtract(Duration(days: 1 , minutes: 1)), Sender: false),
  Message(text: "Okkk", date: DateTime.now().subtract(Duration(days: 1, minutes: 5)), Sender: true),
  Message(text: "Its too late", date: DateTime.now().subtract(Duration(days: 2 , minutes: 6)), Sender: false),
  Message(text: "Coming", date: DateTime.now().subtract(Duration(days: 2 ,minutes: 10)), Sender: true),
  Message(text: "Where Are You", date: DateTime.now().subtract(Duration(days: 3 ,minutes: 5)), Sender: false),
  Message(text: "Yup", date: DateTime.now().subtract(Duration(days: 3 ,minutes: 2)), Sender: true),
  Message(text: "Hello", date: DateTime.now().subtract(Duration(days: 3 ,minutes: 1)), Sender: false),
  Message(text: "No", date: DateTime.now().subtract(Duration(days: 4 , minutes: 1)), Sender: false),
  Message(text: "Is he at office", date: DateTime.now().subtract(Duration(days: 4, minutes: 5)), Sender: true),
  Message(text: "Yes", date: DateTime.now().subtract(Duration(days: 5 , minutes: 6)), Sender: false),
  Message(text: "did you know him", date: DateTime.now().subtract(Duration(days: 2 ,minutes: 10)), Sender: true),
  Message(text: "yes", date: DateTime.now().subtract(Duration(days: 5 ,minutes: 5)), Sender: false),
  Message(text: "i am steve", date: DateTime.now().subtract(Duration(days: 6 ,minutes: 2)), Sender: true),
  Message(text: "Hello", date: DateTime.now().subtract(Duration(days: 6 ,minutes: 1)), Sender: false),
].reversed.toList();

class _UserChatState extends State<UserChat> {
 
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
              child: GroupedListView<Message, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: EdgeInsets.all(8),
                elements: message, 
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 50,
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(DateFormat.yMMMd().format(message.date), style: TextStyle(color: Colors.grey[800]),),
                        ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => 
                  Align(
                    alignment: message.Sender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: message.Sender ? Color(0xffDCF8C6) : Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(message.text, style: TextStyle(),
                        ),
                    ),
                    ),
                  ),
                ),
            ),
            Align(
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
                      final messages = Message(text: messagecontroller.text, date: DateTime.now(), Sender: true);
                        if (messagecontroller.text != "") {
                          setState(() {
                            message.add(messages);
                            messagecontroller.text == "";
                          });
                        }
                    },
                    child: messagecontroller.text.isEmpty ? Icon(Icons.keyboard_voice, color: Colors.white): Icon(Icons.send, color: Colors.white,)),
                  )
                ],
              )
            )
          ]),
        ));
  }


Widget buildTextfield() {
  return TextField(
      controller: messagecontroller,
      cursorColor: Colors.green,
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
      );
}


}