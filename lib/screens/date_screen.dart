import 'package:bunk_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/date_dialog.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key, required this.title, required this.subName});

  final String title;
  final String subName;

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  List<DateTime> _dates = [];
  Map<String, List<DateTime>> inkwellDates = {};

  @override
  void initState() {
    _loadDates();
  }

  Future<void> _loadDates() async {
    final sf = await SharedPreferences.getInstance();
    final List<String>? dateString = sf.getStringList(widget.subName);
    if (dateString != null) {
      setState(() {
        _dates =
            dateString.map((dateString) => DateTime.parse(dateString)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(13.0),
        child: FloatingActionButton(
          onPressed: () async {
            await popUpDialog(context);
            setState(() {});
          },
          backgroundColor: kAppBarColor,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _dates.isEmpty
          ? Center(child: Text('No Bunks for ${widget.title}'))
          : ListView.builder(
              itemCount: _dates.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Card(
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kAppBarColor,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        DateFormat.yMMMd().format(_dates[index]),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DateDialog(
        dateList: inkwellDates,
        subName: widget.title,
        onDateAdded: (newDate) {
          setState(() {
            _dates.add(newDate);
          });
        },
      ),
    );
  }
}
