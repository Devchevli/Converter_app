import 'package:flutter/material.dart';

import 'Tab_Screens/Add_Contact_Screen.dart';
import 'Tab_Screens/Call_Screen.dart';
import 'Tab_Screens/Chats_Screen.dart';
import 'Tab_Screens/Setting_Screen.dart';

class androidScreen extends StatefulWidget {
  const androidScreen({super.key});

  @override
  State<androidScreen> createState() => _androidScreenState();
}

class _androidScreenState extends State<androidScreen> {
  List<Widget> screens = [
    const Add_Contact(),
    chatScreen(),
    callScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
        preferredSize: Size(size.width, size.height / 9999),
        child: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.person_add_alt_1),
          ),
          Tab(
            child: Text("CHATS"),
          ),
          Tab(
            child: Text("CALLS"),
          ),
          Tab(
            child: Text("SETTING"),
          ),
        ]),
      )),
      body: TabBarView(children: screens),
    );
  }
}
