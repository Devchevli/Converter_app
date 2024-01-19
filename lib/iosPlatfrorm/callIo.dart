import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class call_IoScreen extends StatefulWidget {
  const call_IoScreen({super.key});

  @override
  State<call_IoScreen> createState() => _call_IoScreenState();
}

class _call_IoScreenState extends State<call_IoScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blue,
      child: Center(
          child: Container(
        height: 500,
        width: double.infinity,
        color: Colors.white,
      )),
    );
  }
}
