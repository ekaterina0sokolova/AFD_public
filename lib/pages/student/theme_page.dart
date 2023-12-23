import 'package:flutter/material.dart';
import 'package:a_for_dictation/modules/themes_module.dart';

class ThemeScreen extends StatefulWidget {
  final String studentLogin;
  final List<String> args;

  ThemeScreen({required this.studentLogin, required this.args});
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}
class _ThemeScreenState extends State<ThemeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Темы'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<Widget>>(
          future: getTopicsForStudent(widget.studentLogin, widget.args),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              List<Widget> themesListWidgets = snapshot.data!;
              return ListView.builder(
                itemCount: themesListWidgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return themesListWidgets[index];
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Ошибка при загрузке данных'),
              );
            } else {
              return Container();
            }
          },
          );
        },
      ),
    );
  }
}