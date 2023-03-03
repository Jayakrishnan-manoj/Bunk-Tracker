import 'package:bunk_tracker/helpers/shared.dart';
import 'package:bunk_tracker/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bunk_tracker/data/subject.dart';
import 'package:bunk_tracker/data/subject_data.dart';
import 'package:bunk_tracker/widgets/subject_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.branch});
  String branch;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Subject>? displayList;

  @override
  void initState() {
    getBranch(widget.branch).then((value) {
      setState(() {
        widget.branch = value;
      });
    });
    if (widget.branch == 'CSE') {
      setState(() {
        displayList = fourthSemCS;
      });
    } else {
      setState(() {
        displayList = CSCE;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bunk Tracker"),
        // actions: [
        //   SizedBox(
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 12.0, top: 7.0),
        //       child: DropdownButton(
        //         underline: Container(),
        //         icon: const Icon(
        //           FontAwesomeIcons.filter,
        //           color: Colors.white,
        //         ),
        //         dropdownColor: Colors.white,
        //         value: null,
        //         items: subList.map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem(
        //             value: value,
        //             child: Text(
        //               value,
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.w600,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           );
        //         }).toList(),
        //         onChanged: (value) {
        //           setState(() {
        //             _chosenValue = value!;
        //             if (_chosenValue == 'CSCE') {
        //               displayList = CSCE;
        //             } else {
        //               displayList = fourthSemCS;
        //             }
        //           });
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),
      drawer: AppDrawer(
        branch: widget.branch,
        isSelected: true,
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: displayList!
              .map(
                (subData) => SubjectItem(subData.title, subData.id),
              )
              .toList(),
        ),
      ),
    );
  }
}
