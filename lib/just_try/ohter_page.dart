import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Save Image and Navigate'),
        ),
        body: ImageSaveAndNavigate(),
      ),
    );
  }
}
class ImageSaveAndNavigate extends StatefulWidget {
  @override
  _ImageSaveAndNavigateState createState() => _ImageSaveAndNavigateState();
}

class _ImageSaveAndNavigateState extends State<ImageSaveAndNavigate> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null) Image.file(_image!),
        ElevatedButton(
          onPressed: _takePhoto,
          child: Text('Take a photo'),
        ),
        if (_image != null) ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage(image: _image!)),
            );
          },
          child: Text('Go to Next Page'),
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  final File image;

  SecondPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second page'),
            SizedBox(height: 20),
            Image.file(image),
          ],
        ),
      ),
    );
  }
}