import 'package:bunk_tracker/widgets/subject_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAttendance(int val, String id) async {
  final sf = await SharedPreferences.getInstance();
  sf.setInt(id, val);
}

Future<int> getAttendance(String id) async {
  final sf = await SharedPreferences.getInstance();
  return sf.getInt(id) ?? 0;
}

saveDates(Map<String, List<DateTime>> dateList) async {
  final sf = await SharedPreferences.getInstance();
  for (var entry in dateList.entries) {
    await sf.setStringList(
      entry.key,
      entry.value.map((date) => date.toIso8601String()).toList(),
    );
  }
}

Future<Map<String, List<DateTime>>> getDates() async {
  final sf = await SharedPreferences.getInstance();
  Map<String, List<DateTime>> dateList = {};
  for (var key in sf.getKeys()) {
    dateList[key] = sf
        .getStringList(key)!
        .map((dateString) => DateTime.parse(dateString))
        .toList();
  }
  return dateList;
}
