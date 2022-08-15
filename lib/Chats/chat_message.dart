import 'package:flutter/material.dart';

class UserChat extends StatefulWidget {
  final String name;
  final String image;

  const UserChat(this.name, this.image);

  @override
  State<UserChat> createState() => _UserChatState();
}

TextEditingController messagecontroller = TextEditingController();
bool message = false;

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
          backgroundColor: Colors.green[800],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber[50],
          child: Column(children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Hi")),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          
                          child: Center(child: Text("Hello")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Meet me at 12")),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          filled: true,
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
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.keyboard_voice,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class inputMessage extends StatelessWidget {
  const inputMessage(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Text(message),
    );
  }
}
