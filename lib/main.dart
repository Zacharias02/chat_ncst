// import 'package:chat_ncst/helpers/firebase_service.dart';
// import 'package:chat_ncst/screens/chats_screen.dart';
// import 'package:chat_ncst/screens/login_screen.dart';
// import 'package:chat_ncst/screens/registration_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //TODO (1): Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat NCST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 15),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size(500, 50)),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Colors.yellow,
        ),
      ),
      //TODO (2): Remove home and add routes your initial route.
      home: const Scaffold(body: Placeholder()),
    );
  }
}
