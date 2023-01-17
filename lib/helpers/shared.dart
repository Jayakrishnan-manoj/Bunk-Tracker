import 'package:bunk_tracker/widgets/subject_item.dart';
import 'package:shared_preferences/shared_preferences.dart' ;


Future<void> saveAttendance(int val,String id)async {
  final sf= await SharedPreferences.getInstance();
  sf.setInt(id, val);
}

Future<int> getAttendance(String id)async{
  final sf = await SharedPreferences.getInstance();
  return sf.getInt(id) ?? 0;
}