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
  TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBarColor,
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: kTextColor,
                elevation: 5,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _presentController,
                            decoration: formInputDecoration.copyWith(
                              hintText: 'Present',
                              labelText: 'No. of days present',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _totalController,
                            decoration: formInputDecoration.copyWith(
                              hintText: 'Total',
                              labelText: 'Total no. of days',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kAppBarColor,
                              ),
                              child: const Text(
                                "check 75",
                              ),
                            ),
                          )
                        ],
                      ),
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
