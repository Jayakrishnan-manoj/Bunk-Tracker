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
        scaffoldBackgroundColor: const Color(0xFF748cab),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0d1321),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
