
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home_Screen.dart';
import 'androidPlatform/provider/switch_provider.dart';




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


// import 'package:conveter_app/services.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
// void main() async {
//   runApp(
//     MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({
//     super.key,
//   });
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         StreamProvider(
//             create: (context) => NetWorkServices().controller.stream,
//             initialData: NetworkStatus.online)
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         darkTheme: ThemeData(brightness: Brightness.dark),
//         home: const home(),
//       ),
//     );
//   }
// }
//

