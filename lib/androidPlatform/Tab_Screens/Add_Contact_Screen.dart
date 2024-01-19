import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Add_Contact extends StatefulWidget {
  const Add_Contact({super.key});

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {
  XFile? image;
  final picker = ImagePicker();

  void takePhoto() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          image = pickedFile;
        });
        print("image path: ${image!.path}");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextEditingController _nameController = TextEditingController();
    TextEditingController _callController = TextEditingController();
    TextEditingController _chatController = TextEditingController();

    Future<void> loadName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String name = prefs.getString('name') ?? 'default_name';
      String chat = prefs.getString('name') ?? 'default_name';
      _nameController.text = name;
      _chatController.text = chat;
    }

    @override
    void initState() {
      super.initState();
      loadName();
    }

    Future<void> _saveAndNavigate() async {
      String name = _nameController.text;
      String chat = _chatController.text;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('chat', chat);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 80,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
        
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: Colors.black)
                  ),
                  child: image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                            "assets/person.jpg",
                            fit: BoxFit.cover,
                          ),
                      ),
                ),
                Positioned(
                  bottom: 0,
                  right: -15,
                  child: IconButton(
                    onPressed: takePhoto,
                    icon: Icon(CupertinoIcons.add_circled_solid,color: Colors.black,size: 30,),
                  ),
                ),
              ],
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
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
                              initialTime:
                                  const TimeOfDay(hour: 24, minute: 60));
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
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
