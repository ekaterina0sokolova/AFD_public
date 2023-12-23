import 'package:a_for_dictation/pages/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/st_main_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  // final String title;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Фамилия',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Отчество',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Дата рождения',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Пароль',
                      ),
                    ),
                    TextField(
                      onChanged: (email) {
                        // _email = email;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Повторите пароль',
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text('Ученик'),
                              leading: Radio(
                                value: 0,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                            )),
                        Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text('Учитель'),
                              leading: Radio(
                                value: 1,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),

              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => StMainScreen(args: [])));
                        },
                        child: Text('Зарегистрироваться'))
                  ],
                ),
              )
            ]
          )
      ),
    );
  }
}