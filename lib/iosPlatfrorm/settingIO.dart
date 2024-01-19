import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../androidPlatform/provider/switch_provider.dart';

class setting_IoScreen extends StatefulWidget {
  const setting_IoScreen({super.key});

  @override
  State<setting_IoScreen> createState() => _setting_IoScreenState();
}

class _setting_IoScreenState extends State<setting_IoScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final change = Provider.of<switchProvider>(context, listen: false);
    return CupertinoPageScaffold(

        child: Center(

          child: ListView(children: [
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                Container(
                  height: size.height / 9,
                  width: size.width / 1.1,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                       Icon(CupertinoIcons.person, color: Colors.blue, size: 30),
                      SizedBox(
                        width: size.height / 35,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Profile\n",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: 'Update Profile Data',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width / 4,
                      ),
                      Consumer<switchProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return CupertinoSwitch(  value: change.isprofile,onChanged: (value) {
                            change.setprofile();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<switchProvider>(
                  builder: (context, value, child) {
                    return Visibility(
                      visible: change.isprofile,
                      child: ListView(
                        shrinkWrap: true,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height / 120,
                          ),
                          CircleAvatar(backgroundColor: Colors.blue,

                            radius: size.height / 9,
                            child:  Icon(
                              CupertinoIcons.photo_camera_solid,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 100,
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your name..',
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Bio..',
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(fontSize: 20, color: Colors.blue,),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(fontSize: 20, color: Colors.blue,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: size.height / 9,
                  width: size.width / 1.1,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                       Icon(CupertinoIcons.brightness_solid, color: Colors.blue, size: 30),
                      SizedBox(
                        width: size.height / 35,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Profile\n",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: 'change theme',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width / 2.9,
                      ),
                      Consumer<switchProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return CupertinoSwitch(
                              value: change.isThemeChange,
                              onChanged: (value) {
                                change.setThemeChange();
                              });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),);
  }
}
