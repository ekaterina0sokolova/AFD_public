import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<List<List<Map<String, dynamic>>>> getDataForProfilePage() async {
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'));
  List<Future<List<Map<String, dynamic>>>> futures = [
    database.query('tblTeacher'),
    database.query('tblGroup'),
    database.query('tblStudent')
  ];
  List<List<Map<String, dynamic>>> results = await Future.wait(futures);
  return results;
}

Future<Map<String, dynamic>> getDataForStudent(st_login, st_psw) async {
  int st_id = 0;
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'));
  List<Map<String, dynamic>> result = await database.rawQuery('''
    SELECT st.student_id, st.surname, st.name, st.patronymic, st.birthday, st.email, st.password, 
    t.surname || ' ' || substr(t.name, 1, 1) || '. ' || substr(t.patronymic, 1, 1) || '.' as teacher
    FROM tblStudent AS st
    JOIN tblGroup AS gr ON st.group_id = gr.group_id
    JOIN tblTeacher AS t ON gr.teacher_id = t.teacher_id
  ''');
  for (var student in result){
    if (st_login == student['email'] && st_psw == student['password']){
      st_id = student['student_id']-1;
      break;
    }
  }
  return result[st_id];
}

Future<Map<String, dynamic>> getDataForTeacher(tch_login, tch_psw) async {
  print(tch_psw);
  int tch_id = 0;
  Database database = await openDatabase(join(await getDatabasesPath(), 'finaldb_illialla.db'));
  List<Map<String, dynamic>> result = await database.rawQuery('''
    SELECT * FROM tblTeacher
  ''');
  for (var teacher in result){
    if (tch_login == teacher['email'] && tch_psw == teacher['password']){
      print('teacher["password"]: ${teacher["password"]}');
      print('tch_psw: $tch_psw');
      tch_id = teacher['teacher_id'] - 1;
      break;
    }
  }
  return result[tch_id];
}

