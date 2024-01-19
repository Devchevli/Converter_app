import 'package:conveter_app/iosPlatfrorm/settingIO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addContact_Io.dart';
import 'callIo.dart';
import 'chatIo.dart';

void main() => runApp( iosScreen());

class iosScreen extends StatelessWidget {
   iosScreen({super.key});


  List<Widget> screens = [
    addContact_ioScreen(),
    chat_IoScreen(),
    call_IoScreen(),
    setting_IoScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.blue,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_badge_plus),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),

          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return screens[index];
          },
        );
      },
    );
  }
}

