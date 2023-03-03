import 'package:bunk_tracker/constants/constants.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key});

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Delete Bunks",
        style: TextStyle(
          color: kAppBarColor,
        ),
      ),
      content: const SizedBox(
        width: double.maxFinite,
        
      ),
    );
  }
}
