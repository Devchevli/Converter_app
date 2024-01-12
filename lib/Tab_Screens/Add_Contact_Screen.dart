import 'dart:io';
import 'package:conveter_app/Tab_Screens/Chats_Screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../just_try/ohter_page.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({super.key});

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {
  File? pickImage;
  XFile? image;

  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextEditingController _nameController = TextEditingController();
    TextEditingController _callController = TextEditingController();
    TextEditingController _chatController = TextEditingController();

    Future<void> loadName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String name = prefs.getString('name') ?? 'default_name';
      String call = prefs.getString('name') ?? 'default_name';
      String chat = prefs.getString('name') ?? 'default_name';
      _nameController.text = name;
      _callController.text = call;
      _chatController.text = chat;
    }

    @override
    void initState() {
      super.initState();
      loadName();
    }


    Future<void> _saveAndNavigate() async {
      String name = _nameController.text;
      String call = _callController.text;
      String chat = _chatController.text;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('call', call);
      prefs.setString('chat', chat);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => chatScreen()),
      );
    }

    final ImagePicker picker = ImagePicker();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(

              height: size.height / 80,
            ),
            CircleAvatar(


              radius: size.height / 15,
              child: const Icon(
                Icons.add_a_photo_rounded,
              ),
            ),
            SizedBox(
              height: size.height / 100,
            ),
             Column(
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      hintText: 'Full name',
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: _callController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      hintText: 'call conversation',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: _chatController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.chat),
                      border: OutlineInputBorder(),
                      hintText: 'Chat Conversation',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(

                    children: [
                      IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              firstDate: DateTime(DateTime.january),
                              lastDate: DateTime(DateTime.december));
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                      const Text("Date Picker")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 24, minute: 60));
                        },
                        icon: const Icon(Icons.alarm),
                      ),
                      const Text("Time Picker")
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveAndNavigate();
                  },
                  child: Text('Save & Navigate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }

}
