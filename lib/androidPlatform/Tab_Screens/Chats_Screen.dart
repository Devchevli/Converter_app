import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class chatScreen extends StatefulWidget {
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  String name = "";
  String chat = "";
  String profile = "";

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? 'default_name';
    chat = prefs.getString('chat') ?? 'default_name';
    profile = prefs.getString('profile') ?? 'default_name';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height / 10,
              width: size.width / 1.1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [

                    Container(
                      height: size.height,
                      width: size.width / 5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: profile.isNotEmpty
                            ? Image.file(
                          File(profile), // Assuming profile is the file path
                          fit: BoxFit.cover,
                        )
                            : Placeholder(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name: $name'),
                        Text('Name: $chat'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
