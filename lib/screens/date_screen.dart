import 'package:bunk_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key, required this.title, required this.subName});

  final String title;
  final String subName;

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  List<DateTime> _dates = [];

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
      body: _dates.isEmpty
          ? Center(child: Text('No Bunks for ${widget.title}'))
          : ListView.builder(
              itemCount: _dates.length,
              itemBuilder: (context, index) {
                return ListTile(
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
                );
              },
            ),
    );
  }
}
