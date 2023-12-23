import 'package:a_for_dictation/db_controllers/profile_page_controller.dart';

Future<List<dynamic>> prepareData(List<String> args) async {
  print('args: $args');
  print('args: ${args[0]}');
  print('args: ${args[1]}');
  Map<String, dynamic> studentData = await getDataForStudent(args[0], args[1]);
  print('studentData: $studentData');
  return [studentData];
}