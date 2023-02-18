import 'package:bunk_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({required this.title, required this.dates});

  final String title;
  final List<DateTime>? dates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Screen"),
      ),
      body: dates == null || dates!.isEmpty
          ? Center(child: Text('No Bunks for $title'))
          : ListView.builder(
              itemCount: dates!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kAppBarColor,
                    child: Text(
                      index.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    DateFormat.yMMMd().format(
                      dates![index],
                    ),
                  ),
                );
              },
            ),
    );
  }
}


// ListView.builder(itemBuilder: (context, index) {
//         return Card(
//           elevation: 5,
//           child: ListTile(
//             title: Text(date),
//             trailing: IconButton(
//               icon: const Icon(
//                 Icons.delete,
//                 color: Colors.red,
//               ),
//               onPressed: () {},
//             ),
//           ),
//         );
//       }),