import 'package:conveter_app/Tab_Screens/Call_Screen.dart';
import 'package:conveter_app/Tab_Screens/Chats_Screen.dart';
import 'package:conveter_app/Tab_Screens/Setting_Screen.dart';
import 'package:conveter_app/provider/switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Tab_Screens/Add_Contact_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
        List<Widget> screens = [
      const Add_Contact(),
      const Chats_Screen(),
      const Call_Screen(),
      const SettingScreen(),
    ];
        final platformChange = Provider.of<switchProvider>(context, listen: false);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title:  Text("Platform Conveter"),
          actions: [
            Consumer<switchProvider>(
              builder: (context, value, child) {
                return Switch(
                    value: platformChange.isactive,
                    onChanged: (value) {
                      platformChange.setActive();
                    });
              },
            )
          ],
          bottom:   const TabBar(

            tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "CALL",
              ),
              Tab(
                text: "SETTING",
              ),
            ],
          ),
        ),
        body:  TabBarView(children: screens),

      ),
    );
  }
}
