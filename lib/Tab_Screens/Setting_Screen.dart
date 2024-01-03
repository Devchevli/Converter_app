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
        child: Column(
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

              builder: (context,value,child){
                return  Visibility(
                  visible: change.isActive,

                  child: ListView(
                    shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 80,
                      ),
                      CircleAvatar(
                        radius: size.height / 15,
                        child: Icon(
                          Icons.add_a_photo_rounded,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 100,
                      ),
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                hintText: 'Full name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                                hintText: 'Full name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.chat),
                                border: OutlineInputBorder(),
                                hintText: 'Full name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDatePicker(
                                      context: context,
                                      firstDate: DateTime(DateTime.january),
                                      lastDate: DateTime(DateTime.december));
                                },
                                icon: Icon(Icons.calendar_month),
                              ),
                              Text("Date Picker")
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay(hour: 24, minute: 60));
                                },
                                icon: Icon(Icons.alarm),
                              ),
                              const Text("Time Picker")
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
                  Icon(Icons.sunny, color: Colors.grey, size: 30),
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
      ),
    );
  }
}
