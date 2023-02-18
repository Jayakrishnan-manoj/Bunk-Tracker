import 'package:flutter/material.dart';

int reqAttendance(int present, int total) {
  return (75 * total - 100 * present) ~/ (100 - 75);
}

int daysToBunk(int present, total) {
  return (100 * present - 75 * total) ~/ 75;
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle( 
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
