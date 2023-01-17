import 'package:flutter/material.dart';
import 'Calls/dashboard.dart';
import 'Camera/camera_dashboard.dart';
import 'Chats/dashboardModel.dart';
import 'Status/dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

bool show_textfield = false;
bool show_title = true;
bool show_search_icon = true;
bool show_popupmenubutton = true;


void changeVisibility_false(){
 setState(() {
      show_textfield = true;
      show_title = false;
      show_search_icon = false;
      show_popupmenubutton = false;   
 }); 
}

void changeVisibility_true(){
 setState(() {
      show_textfield = false;
      show_title = true;
      show_search_icon = true;
      show_popupmenubutton = true;   
 }); 
}


  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff128C7E),
            title: Visibility(
              visible: show_title,
              child: const Text("WhatsApp Clone")),
            actions: [
              Visibility(
                visible: show_textfield,
                child: SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: GestureDetector(
                        onTap: (){changeVisibility_true();},
                        child: Icon(Icons.arrow_back, color: Colors.black,)),
                      hintText: "Search"
                      
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: show_search_icon,
                child: GestureDetector(
                  onTap: (){
                    changeVisibility_false();
                  },
                  child: Icon(Icons.search))),
              SizedBox(
                width: 10,
              ),
              Visibility(
                visible: show_popupmenubutton,
                child: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                          PopupMenuItem(child: Text('New group')),
                          PopupMenuItem(child: Text('New broadcast')),
                          PopupMenuItem(child: Text('Linked devices')),
                          PopupMenuItem(child: Text('Starred messages')),
                          PopupMenuItem(child: Text('Settings'))
                        ]),
              )
            ],
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                  child: Tab(
                    icon: Icon(Icons.groups_outlined),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Tab(
                    text: "CHATS",
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Tab(
                    text: "STATUS",
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Tab(
                    text: "CALLS",
                  ))
            ]),
          ),
          body: TabBarView(children: [
            Camera(),
            Chat(),
            Status(),
            Calls(),
          ])));
}
