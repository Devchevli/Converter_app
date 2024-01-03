import 'package:flutter/material.dart';

class Call_Screen extends StatefulWidget {
  const Call_Screen({super.key});

  @override
  State<Call_Screen> createState() => _Call_ScreenState();
}

class _Call_ScreenState extends State<Call_Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("No any calls yet")],
        ),
      ),
    );
  }
}
