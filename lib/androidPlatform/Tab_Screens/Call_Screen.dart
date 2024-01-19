import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class callScreen extends StatefulWidget {
  @override
  _callScreenState createState() => _callScreenState();
}

class _callScreenState extends State<callScreen> {
  String name = "";
  String chat = "";

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? 'default_name';
    chat = prefs.getString('chat') ?? 'default_name';
    setState(() {});
  }

  call({required String contactNumber}) async {
    Uri url = Uri(scheme: "tell", path: '7016711700');
    await launchUrl(url);
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
                        borderRadius: BorderRadius.all(Radius.circular(70)),
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
                    SizedBox(
                      width: size.width / 3.5,
                    ),
                    IconButton(
                      color: CupertinoColors.activeGreen,
                      onPressed: () async {
                        call(contactNumber: "7016711700");
                        Uri uri = Uri.parse("7016711700");
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      icon: Icon(Icons.call),
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
