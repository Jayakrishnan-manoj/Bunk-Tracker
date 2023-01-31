import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/screens/check75_screen.dart';
import 'package:bunk_tracker/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({required this.isSelected});

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              selectedTileColor: kAppBarColor,
              selected: isSelected,
              leading: const Icon(
                FontAwesomeIcons.chartLine,
                color: kTextColor,
              ),
              title: const Text(
                "Bunk Trackr",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 17,
                ),
              ),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen(),
                ),
              ),
            ),
            ListTile(
              selectedTileColor: kAppBarColor,
              selected: !isSelected,
              leading: const Icon(
                FontAwesomeIcons.calendar,
                color: kTextColor,
              ),
              title: const Text(
                "Attendance 75",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 17,
                ),
              ),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AttendanceCheck(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.github,
                color: kTextColor,
              ),
              title: const Text(
                "View Source Code",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 17,
                ),
              ),
              onTap: () async {
                String url =
                    "https://github.com/Jayakrishnan-manoj/Bunk-Tracker";
                var urllaunchable = await canLaunchUrl(
                  Uri.parse(url),
                );
                if (urllaunchable) {
                  await launchUrl(
                    Uri.parse(url),
                  );
                } else {
                  print("url can't be launched");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
