import 'package:flutter/material.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({super.key});

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      hintText: 'chat conversation',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
