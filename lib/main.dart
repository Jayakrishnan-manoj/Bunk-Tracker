import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bunk Tracker",
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white ,
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppBarColor
        ),
      ),
      home: HomeScreen(),
    );
  }
}

// const Color(0xFF748cab)
