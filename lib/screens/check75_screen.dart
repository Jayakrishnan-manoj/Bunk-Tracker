import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AttendanceCheck extends StatefulWidget {
  const AttendanceCheck({super.key});

  @override
  State<AttendanceCheck> createState() => _AttendanceCheckState();
}

class _AttendanceCheckState extends State<AttendanceCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance75"),
      ),
      drawer: AppDrawer(
        isSelected: false,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.only(
      //     left: 20,
      //     right: 20,
      //     bottom: 50,
      //     top: 10,
      //   ),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             child: const Text(
      //               "Present",
      //               style: TextStyle(
      //                   color: Colors.white, fontWeight: FontWeight.w700),
      //             ),
      //           ),
      //           TextFormField(
      //             decoration: textInputDecoration.copyWith(
      //               labelText: "Present"
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
