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
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1d2d44),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 7,
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      shape: CircleBorder()),
                  onPressed: () {
                    setState(() {
                      attendance--;
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 7,
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      shape: CircleBorder()),
                  onPressed: () {
                    setState(() {
                      attendance++;
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
