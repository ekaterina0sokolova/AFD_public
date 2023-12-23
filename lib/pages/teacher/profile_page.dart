import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/authentication_page.dart';
import 'package:a_for_dictation/db_controllers/profile_page_controller.dart';

class TchProfileScreen extends StatefulWidget {
  const TchProfileScreen({super.key, required this.args});
  final List<String> args;

  @override
  _TchProfileScreenState createState() => _TchProfileScreenState(args: args);
}

class _TchProfileScreenState extends State<TchProfileScreen> {
  List<String> args;
  _TchProfileScreenState({required this.args});

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> prepareData() async {
      Map<String, dynamic> teacherData = await getDataForTeacher(args[0], args[1]);
      return [teacherData];
    }

    return FutureBuilder<List<dynamic>>(
      // future: prepareDataTableRows(),
        future: prepareData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            Map<String, dynamic> teacherData = snapshot.data![0];
            TextEditingController _surnameController = TextEditingController(
                text: teacherData['surname']);
            TextEditingController _nameController = TextEditingController(
                text: teacherData["name"]);
            TextEditingController _patronymicController = TextEditingController(
                text: teacherData["patronymic"]);
            TextEditingController _birthdateController = TextEditingController(
                text: teacherData["birthday"]);
            TextEditingController _emailController = TextEditingController(
                text: teacherData["email"]);
            Color btnColor = Color(0xFFF88686);
            return Scaffold(
                appBar: AppBar(
                  title: Text('Личный кабинет'),
                ),
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Фамилия
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 5.0),
                          child: Text(
                            'Фамилия',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _surnameController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Имя
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 5.0),
                          child: Text(
                            'Имя',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _nameController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Отчество
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 5.0),
                          child: Text(
                            'Отчество',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _patronymicController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Дата рождения
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 5.0),
                          child: Text(
                            'Дата рождения',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _birthdateController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Почта
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 5.0),
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 135.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        AuthenticationScreen(title: 'Вход',)),);
                                }, // Действия, выполняемые при нажатии на кнопку
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: btnColor,
                                  fixedSize: Size(300, 20),
                                ),
                                child: Text('Выйти'),
                              ),
                            )
                        )
                      ]
                  ),
                )
            );
          }
        });
  }
}


