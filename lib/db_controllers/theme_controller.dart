import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<Map<String, dynamic>>> getTopicsListForStudent(String login) async {
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);

  List<Map<String, dynamic>> studentGroupIdDict = await database.query(
      'tblStudent',
      columns: ['group_id'],
      where: 'email = "$login"'
  );
  String groupId = studentGroupIdDict[0]["group_id"].toString();

  List<Map<String, dynamic>> teacherIdDict = await database.query(
      'tblGroup',
      columns: ['teacher_id'],
      where: 'group_id = "$groupId"'
  );
  String teacherId = teacherIdDict[0]["teacher_id"].toString();

  List<Map<String, dynamic>> topics = await database.query(
      'tblTopic',
      where: 'teacher_id = $teacherId'
  );

  return topics;
}

Future<List<Map<String, dynamic>>> getTopicsListForTeacher(String login) async {
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);
  List<Map<String, dynamic>> teacherIdDict = await database.query(
      'tblTeacher',
    columns: ['teacher_id'],
    where: 'email = "$login"'
  );
  String teacherId = teacherIdDict[0]["teacher_id"].toString();
  List<Map<String, dynamic>> topics = await database.query(
      'tblTopic',
     where: 'teacher_id = $teacherId'
  );
  return topics;
}

Future<List<Map<String, dynamic>>> getVocabList(String themeId) async {
  int id = int.parse(themeId);
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);
  List<Map<String, dynamic>> vocab = await database.query(
      'tblVocabulary',
    columns: ['word', 'translation'],
    where: 'topic_id = $id');
  return vocab;
}


Future<List<List<Map<String, dynamic>>>> getData() async {
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);
  List<Future<List<Map<String, dynamic>>>> futures = [
    database.query('tblTeacher'),
    database.query('tblGroup'),
    database.query('tblStudent'),
    database.query('tblTopic'),
    database.query('tblVocabulary')
  ];
  List<List<Map<String, dynamic>>> results = await Future.wait(futures);
  await database.close();
  return results;
}