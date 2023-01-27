import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AttendanceCheck extends StatefulWidget {
  const AttendanceCheck({super.key});

  @override
  State<AttendanceCheck> createState() => _AttendanceCheckState();
}

class _AttendanceCheckState extends State<AttendanceCheck> {
  TextEditingController _presentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTextColor,
        title: const Text("Attendance75"),
      ),
      drawer: AppDrawer(
        isSelected: false,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                color: kTextColor,
                elevation: 5,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _presentController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Present',
                            labelText: 'No. of days present',
                            labelStyle: TextStyle(
                              color: kAppBarColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
