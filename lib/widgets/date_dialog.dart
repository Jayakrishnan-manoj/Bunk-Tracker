import 'package:bunk_tracker/constants/constants.dart';
import 'package:bunk_tracker/helpers/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDialog extends StatefulWidget {
  DateDialog({
    super.key,
    required this.dateList,
    required this.subName,
    required this.onDateAdded,
  });
  Map<String, List<DateTime>> dateList = {};
  final String subName;
  final Function(DateTime) onDateAdded;

  @override
  State<DateDialog> createState() => _DateDialogState();
}

class _DateDialogState extends State<DateDialog> {
  DateTime? dateText;

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2023),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dateText = pickedDate;
      });
      widget.onDateAdded(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dateList[widget.subName] == null) {
      widget.dateList[widget.subName] = [];
    }
    return AlertDialog(
      title: const Text(
        "Add Bunk",
        style: TextStyle(
          color: kAppBarColor,
        ),
      ),
      content: dateText == null
          ? const Text("No Date Chosen")
          : Text(
              DateFormat.yMMMd().format(dateText as DateTime),
            ),
      actions: [
        dateText == null
            ? ElevatedButton.icon(
                onPressed: () {
                  _datePicker();
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Date"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAppBarColor,
                ),
              )
            : IconButton(
                onPressed: () async {
                  widget.dateList[widget.subName]!.add(dateText!);
                  await saveDates(widget.dateList);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.check,
                  color: kAppBarColor,
                ),
              ),
      ],
    );
  }
}
