import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class chat_IoScreen extends StatefulWidget {
  const chat_IoScreen({super.key});

  @override
  State<chat_IoScreen> createState() => _chat_IoScreenState();
}

class _chat_IoScreenState extends State<chat_IoScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blue,
      child: Center(
          child: Container(
            height: 500,
            width: double.infinity,
            color: Colors.red,
          )),
    );


  }
}
