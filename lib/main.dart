import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ncst_kiosk_library/login_page.dart';
import 'package:ncst_kiosk_library/utils/environment.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NCST Kiosk Library',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Solitreo',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: const TextStyle(fontSize: 36.0),
          bodyMedium: const TextStyle(fontSize: 14.0, fontFamily: 'Solitreo', color: Colors.black),
          bodyLarge: const TextStyle(fontFamily: 'Solitreo', color: Colors.black),
          headlineMedium: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          )
        ),
      ),
      home: const LoginPageWidget(),
    );
  }
}
