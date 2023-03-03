import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/screens/date_screen.dart';
import 'package:bunk_tracker/widgets/date_dialog.dart';
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
  

  @override
  void initState() {
    getAttendance(widget.id).then((value) {
      setState(() {
        attendance = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DateScreen(
            title: widget.title,
            subName: widget.title,
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.blue,
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: kAppBarColor,
            ),
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
                  Text(attendance.toString(), style: kGridTextStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

// ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     elevation: 7,
                  //     backgroundColor: kAppBarColor,
                  //     shape: const CircleBorder(),
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => DateScreen(
                  //             title: widget.title,
                  //             subName: widget.title,
                  //           ),
                  //         ),
                  //       );
                  //       if (attendance > 0) {
                  //         attendance--;
                  //         saveAttendance(attendance, widget.id);
                  //       }
                  //     });
                  //   },
                  //   child: const Icon(
                  //     FontAwesomeIcons.minus,
                  //     color: Colors.white,
                  //   ),
                  // ),

// ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     elevation: 7,
                  //     backgroundColor:
                  //         Theme.of(context).appBarTheme.backgroundColor,
                  //     shape: const CircleBorder(),
                  //   ),
                  //   onPressed: () {
                  //     popUpDialog(context);
                  //     setState(() {
                  //       saveAttendance(attendance, widget.id)
                  //           .whenComplete(() => attendance++);
                  //       if (!inkwellDates.containsKey(widget.title)) {
                  //         inkwellDates[widget.title] = [];
                  //       }
                  //     });
                  //   },
                  //   child: const Icon(
                  //     FontAwesomeIcons.plus,
                  //     color: Colors.white,
                  //   ),
                  // ),