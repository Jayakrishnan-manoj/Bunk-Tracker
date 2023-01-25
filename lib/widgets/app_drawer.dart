import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/screens/check75_screen.dart';
import 'package:bunk_tracker/screens/date_screen.dart';
import 'package:bunk_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              ),
              child: Container(
                height: 70,
                color: kAppBarColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.chartLine),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Bunk Trackr",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>  AttendanceCheck(),
                ),
              ),
              child: Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.calendar),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Attendance 75",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
