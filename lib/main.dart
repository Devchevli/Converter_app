import 'package:conveter_app/provider/switch_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home_Screen.dart';
import 'just_try/shared_preference.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => switchProvider()),
              ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home_Screen(),
      ),
    );
  }
}
