import 'package:flutter/material.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({required this.title, required this.date});

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: ListTile(
            title: Text(date),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ),
        );
      }),
    );
  }
}
