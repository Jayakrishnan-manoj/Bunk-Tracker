import 'package:bunk_tracker/constants/reusables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/screens/check75_screen.dart';
import 'package:bunk_tracker/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({required this.isSelected});

  bool isSelected;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              selectedTileColor: kAppBarColor,
              selected: widget.isSelected,
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
              selected: !widget.isSelected,
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
                setState(() {
                  _isLoading = true;
                });
                String url =
                    "https://github.com/Jayakrishnan-manoj/Bunk-Tracker";
                var urllaunchable = await launchUrl(
                  Uri.parse(url),
                );
                if (urllaunchable) {
                  await launchUrl(
                    Uri.parse(url),
                  );
                } else {
                  showSnackBar(
                    context,
                    Colors.red,
                    "Unable to load link",
                  );
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
