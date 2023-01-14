import 'package:bunk_tracker/data/dummy_data.dart';
import 'package:bunk_tracker/widgets/subject_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bunk Tracker"),
      ),
      body: GridView(
        padding: EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: fourthSemCS
            .map(
              (subData) =>
                  SubjectItem(subData.title, subData.color, subData.id),
            )
            .toList(),
      ),
    );
  }
}
