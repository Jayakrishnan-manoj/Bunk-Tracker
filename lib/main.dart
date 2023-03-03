import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/helpers/shared.dart';
import 'package:bunk_tracker/screens/home_screen.dart';
import 'package:bunk_tracker/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final String? branch = prefs.getString('branch');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? branch;

  Future<void> _checkBranch() async {
    final savedBranch = await getBranch('branch');
    setState(() {
      branch = savedBranch == null? '' : savedBranch;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkBranch();
  }

  @override
  Widget build(BuildContext context) {
    print(branch);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bunk Tracker",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
      ),
      home: branch == ''
          ? BranchScreen()
          : HomeScreen(branch: branch!),
    );
  }
}
