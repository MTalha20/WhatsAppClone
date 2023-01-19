import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappclone/sharedData.dart';
import 'my_status.dart';
import 'other_status.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {

  @override
  void initState() {
    var screen = Provider.of<Screen>(context, listen: false);
    screen.changeScreenVal(2);
    print("Screen " + screen.getScreenVal().toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                child: FloatingActionButton(
              backgroundColor: Colors.grey[300],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Container(
                child: FloatingActionButton(
              backgroundColor: Color(0xff128C7E),
              onPressed: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: MyStatus(),
                title: Text(
                  "My status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Tap to add status updates"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Recent Updates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              OtherStatus("Person1", "Today, 12:01", "assets/bg.jpg", true, 1),
              OtherStatus("Person2", "Today, 12:01", "assets/bg.jpg", true, 3),
              OtherStatus("Person3", "Today, 12:01", "assets/bg.jpg", true, 5),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Viewed Updates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
            OtherStatus("Person4", "Today, 12:01", "assets/bg.jpg", false, 1),
            OtherStatus("Person5", "Today, 12:01", "assets/bg.jpg", false, 4),
            OtherStatus("Person7", "Today, 12:01", "assets/bg.jpg", false, 2),
            OtherStatus("Person11", "Today, 12:01", "assets/bg.jpg", false, 8),
            OtherStatus("Person9", "Today, 12:01", "assets/bg.jpg", false, 2),
            ],
          ),
        ));
  }
}

