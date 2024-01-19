
import 'package:conveter_app/androidPlatform/androidScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'androidPlatform/provider/switch_provider.dart';
import 'iosPlatfrorm/iosScreen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {

        final platformChange = Provider.of<switchProvider>(context, listen: false);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title:  Text("Platform Conveter"),
          actions: [
            Consumer<switchProvider>(
              builder: (context, platformChange, child) {
                return Switch(
                    value: platformChange.isplatformChange,
                    onChanged: (value) {
                      platformChange.setplatform();
                    });
              },
            ),
          ],
        ),
        body:   Consumer<switchProvider>(
          builder: (context, platformChange, child) {
            return platformChange.isplatformChange ? iosScreen() : androidScreen();
          },
        ),
      ),
    );
  }
}
