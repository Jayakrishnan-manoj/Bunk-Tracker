import 'package:bunk_tracker/data/subject_data.dart';
import 'package:bunk_tracker/widgets/subject_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> subList = [
    'CSE',
    'CSCE',
  ];

  String _chosenValue = 'CSE';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bunk Tracker"),
        actions: [
          DropdownButton(
            icon:const  Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
            ),
            dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
            value: _chosenValue,
            items: subList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
            // hint: const Icon(
            //   FontAwesomeIcons.filter,
            //   color: Colors.white,
            // ),
            onChanged: (value) {
              setState(() {
                _chosenValue = value!;
              });
            },
          ),
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: fourthSemCS
            .map(
              (subData) => SubjectItem(subData.title, subData.id),
            )
            .toList(),
      ),
    );
  }
}
