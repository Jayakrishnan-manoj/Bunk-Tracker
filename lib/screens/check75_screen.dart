import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/constants/reusables.dart';
import 'package:bunk_tracker/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AttendanceCheck extends StatefulWidget {
  AttendanceCheck({required this.branch});
  String branch;

  @override
  State<AttendanceCheck> createState() => _AttendanceCheckState();
}

class _AttendanceCheckState extends State<AttendanceCheck> {
  TextEditingController _presentController = TextEditingController();
  TextEditingController _totalController = TextEditingController();
  int required = 0;
  int canBunk = 0;
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBarColor,
      appBar: AppBar(
        backgroundColor: kTextColor,
        title: const Text("Attendance75"),
      ),
      drawer: AppDrawer(
        branch: widget.branch,
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
                              labelText: 'No. of days present',
                            ),
                            style: const TextStyle(
                              color: kAppBarColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _totalController,
                            decoration: formInputDecoration.copyWith(
                              labelText: 'Total no. of days',
                            ),
                            style: const TextStyle(
                              color: kAppBarColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  required = reqAttendance(
                                    int.parse(_presentController.text),
                                    int.parse(_totalController.text),
                                  );
                                  canBunk = daysToBunk(
                                    int.parse(_presentController.text),
                                    int.parse(_totalController.text),
                                  );
                                  _checked = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kAppBarColor,
                              ),
                              child: const Text(
                                "check 75",
                              ),
                            ),
                          ),
                          _checked
                              ? Text(
                                  Result(canBunk, required),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              : const Text(''),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String Result(int bunk, int req) {
    if (bunk < 0) {
      return "You need to attend $req more days to attain 75% attendance";
    } else if (bunk > 0) {
      return 'you can bunk for $bunk more days';
    } else if (bunk == 0) {
      return 'you have perfect attendance!';
    } else {
      return '';
    }
  }
}
