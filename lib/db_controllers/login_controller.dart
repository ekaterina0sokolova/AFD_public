import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tuple/tuple.dart';

Future<Tuple2<List<Map<String, dynamic>>, int>> getLoginData(String email) async {
  // флаг для определения роли пользователя
  // 0 - ученик, 1 - учитель
  int role;
  String path = join(await getDatabasesPath(), 'finaldb_illialla.db');
  Database database = await openDatabase(path);
  // ищем ученика по логину
  List<Map<String, dynamic>> loginDataStudent = await database.query(
      'tblStudent',
      columns: ['email', 'password'],
      where: 'email = "$email"');

  // если мы не нашли ученика по email, то ищем учителя
  if (loginDataStudent.isEmpty)
  {
    role = 1;
    List<Map<String, dynamic>> loginDataTeacher = await database.query(
        'tblTeacher',
        columns: ['email', 'password'],
        where: 'email = "$email"');
    if (loginDataTeacher.isEmpty){
      role = 2;
      return Tuple2([{}], role);
    }
    return Tuple2(loginDataTeacher, role);
  }
  role = 0;
  return Tuple2(loginDataStudent, role);
}
