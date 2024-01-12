import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/switch_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final change = Provider.of<switchProvider>(context, listen: false);
    return Scaffold(
      body: Center(
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
                    const Icon(Icons.person, color: Colors.grey, size: 30),
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
                        return Switch(
                            value: change.isActive,
                            onChanged: (value) {
                              change.setIsActive();
                            });
                      },
                    ),
                  ],
                ),
              ),
              Consumer<switchProvider>(
                builder: (context, value, child) {
                  return Visibility(
                    visible: change.isActive,
                    child: ListView(
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height / 120,
                        ),
                        CircleAvatar(
                          radius: size.height / 9,
                          child: const Icon(
                            Icons.add_a_photo_rounded,
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
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(fontSize: 20),
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
                    const Icon(Icons.sunny, color: Colors.grey, size: 30),
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
                        return Switch(
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
      ),
    );
  }
}
