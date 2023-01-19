import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../sharedData.dart';
import 'dashboardModel.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  void initState() {
    var screen = Provider.of<Screen>(context, listen: false);
    screen.changeScreenVal(3);
    print("Screen " + screen.getScreenVal().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
            child: FloatingActionButton(
          backgroundColor: Color(0xff128C7E),
          onPressed: () {},
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        )),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.green, child: Icon(Icons.link_sharp)),
              title: Text("Create call link"),
              subtitle: Text("Share a link for your WhatsApp call"),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text("Recent"),
            ),
            CallTile("assets/bg.jpg", "Person1", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person2", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person3", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person4", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person5", "Yesterday, 12:01"),
            CallTile("assets/bg.jpg", "Person6", "Yesterday, 12:01"),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
