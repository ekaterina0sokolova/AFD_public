import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/st_main_page.dart';
import 'package:a_for_dictation/pages/teacher/tch_main_page.dart';
import 'package:tuple/tuple.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:a_for_dictation/modules/login_module.dart';
import 'dart:async';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key, required this.title});
  final String title;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

// Состояние страницы
class _AuthenticationScreenState extends State<AuthenticationScreen> {
  List<String> args = [];
  bool _showError = false;
  String errorMessage = '';
  String _email = "";
  String _password = "";

  @override

  // данные о пользователе, который вошел
  Tuple2<List<Map<String, String>>, int> userData = Tuple2([{}], 0);
  int role = 2;

  bool login(_email, _password) {
    print('pass and mail in db ${userData} ${userData.item1} ${userData.item2}');
    print('userdata - ${userData.item1[0].containsValue(_password)}');
    // если введенные логин и пароль совпадают с данными пользователя в бд
    if (userData.item1[0].containsValue(_email) &&
        userData.item1[0].containsValue(_password)) {
      role = userData.item2;
      return true;
    }
    return false;
  }

  void _handleLogin(_email, _password) {
    print('email handle ${_email}');
    print('pass handle ${_password}');
    role = userData.item2;
    print('role handle ${role}');
    // проверяем логин, пароль пользователя и его роль
    if (login(_email, _password)) {
      if (role == 0) {
        args.addAll([_email, _password]);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StMainScreen(args: args)));
        setState(() {
          _showError = false;
        });
      }
      if (role == 1) {
        args.addAll([_email, _password]);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TchMainScreen(args: args)));
        setState(() {
          _showError = false;
        });
      }
    } else {
      print('role else ${role}');
      print(login(_email, _password));
      print(_email);
      print(_password);
      setState(() {
        _showError = true;
        errorMessage = 'Неверный логин или пароль';
      });
      // Установливаем таймер на 3 секунды
      Timer(Duration(seconds: 3), () {
        setState(() {
          _showError = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<Tuple2<List<Map<String, String>>, int>>(
            future: getUserData(_email, _password),
            builder: (context, AsyncSnapshot snapshot) {
              return  Padding(
                  padding: EdgeInsets.all(20.0), // Установите отступ здесь
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(0.0),
                      child: Image.asset("assets/blue_wave.png"),
                    ),
                    // logo
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    // inputs
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              onChanged: (email) {
                                setState(() {
                                  _email = email;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            TextField(
                              onChanged: (password) {
                                setState(() {
                                  _password = password;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Пароль',
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20.0),
                            if (_showError)
                              Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        )),
                    // buttons
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDAC8EF),
                              fixedSize: Size(300,
                                  20), // изменить ширину кнопки на 200 пикселей
                            ),
                            child: Text('Войти'),
                            onPressed: () {
                              if (snapshot.hasData) {
                                userData = snapshot.data;
                              }
                              print('userData: $userData');
                              _handleLogin(_email,
                                  md5.convert(utf8.encode(_password)).toString());
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              );
            },
          );
        },
      ),
    );
  }
}
