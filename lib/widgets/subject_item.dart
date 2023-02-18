import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/data/subject.dart';
import 'package:bunk_tracker/screens/date_screen.dart';
import 'package:bunk_tracker/widgets/attendance_record.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bunk_tracker/helpers/shared.dart';

class SubjectItem extends StatefulWidget {
  final String title;
  final String id;

  SubjectItem(this.title, this.id);

  @override
  State<SubjectItem> createState() => _SubjectItemState();
}

class _SubjectItemState extends State<SubjectItem> {
  int attendance = 0;
  Map<String, List<DateTime>> inkwellDates = {};

  @override
  void initState() {
    getAttendance(widget.id).then((value) {
      setState(() {
        attendance = value;
      });
    });
    super.initState();
  }

  //int attendance = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DateScreen(
            title: widget.title,
            dates: inkwellDates[widget.title],
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: const Color(0xFF2cb67d)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(widget.title, style: kGridTextStyle),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                    backgroundColor: kAppBarColor,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      attendance--;
                      saveAttendance(attendance, widget.id);
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  ),
                ),
                Text(
                  attendance.toString(),
                  style: kGridTextStyle,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      attendance++;
                      saveAttendance(attendance, widget.id);
                      if (!inkwellDates.containsKey(widget.title)) {
                        inkwellDates[widget.title] = [];
                      }
                      inkwellDates[widget.title]!.add(DateTime.now());
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
