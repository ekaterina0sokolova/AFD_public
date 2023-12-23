import 'package:a_for_dictation/db_controllers/login_controller.dart';
import 'package:tuple/tuple.dart';

// получаем логин и пароль из БД
Future<Tuple2<List<Map<String, String>>, int>> getUserData(_email, _password) async {
  Tuple2<List<Map<String, dynamic>>, int> userData;
  userData = await getLoginData(_email);
  Tuple2<List<Map<String, String>>, int> userDataString = Tuple2(
    userData.item1.map((map) => map.map((key, value) => MapEntry(key, value.toString()))).toList(),
    userData.item2,
  );
  print('GET USER DATA ${userDataString}');
  return userDataString;
}