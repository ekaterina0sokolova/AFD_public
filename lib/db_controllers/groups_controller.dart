import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<Map<String, dynamic>>> getGroupsData() async {
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);
  List<Map<String, dynamic>> groups = await database.rawQuery('SELECT * FROM tblGroup;');
  return groups;
}

Future<List<Map<String, dynamic>>> getListOfStudents(groupId) async {
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'));
  List<Map<String, dynamic>> result = await database.rawQuery('''
    SELECT st.surname || ' ' || st.name as student
    FROM tblStudent as st
    WHERE st.group_id = $groupId
  ''');
  print('students: $result');
  return result;
}

Future<List<Map<String, dynamic>>> getListOfTopics(groupId) async {
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'));
  List<Map<String, dynamic>> result = await database.rawQuery('''
    SELECT tp.name
    FROM tblTopic as tp
    JOIN tblTeacher AS t ON tp.teacher_id = t.teacher_id
    JOIN tblGroup AS gr ON gr.teacher_id = t.teacher_id
    WHERE gr.group_id = $groupId
  ''');
  print('topics: $result');
  return result;
}