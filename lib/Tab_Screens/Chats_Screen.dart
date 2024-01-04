import 'package:flutter/material.dart';

class Chats_Screen extends StatefulWidget {
  const Chats_Screen({super.key});

  @override
  State<Chats_Screen> createState() => _Chats_ScreenState();
}

class _Chats_ScreenState extends State<Chats_Screen> {
  @override
  Widget build(BuildContext context) {
    return





      const Scaffold(
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No any chats yet")

          ],
        ),
      ),
    );
  }
}
