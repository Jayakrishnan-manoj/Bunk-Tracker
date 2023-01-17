import 'package:bunk_tracker/helpers/shared.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubjectItem extends StatefulWidget {
  final String title;
  final String id;

  SubjectItem(this.title, this.id);

  @override
  State<SubjectItem> createState() => _SubjectItemState();
}



class _SubjectItemState extends State<SubjectItem> {

  int attendance = 0;

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
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: const Color(0xFF2cb67d)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF1d2d44),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
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
                  style: const TextStyle(
                    color: Color(0xFF1d2d44),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
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

//const Color(0xFF1d2d44)