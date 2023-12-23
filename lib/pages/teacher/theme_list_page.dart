import 'package:flutter/material.dart';
import 'package:a_for_dictation/modules/themes_module.dart';

class ThemeListScreen extends StatefulWidget {
  final String teacherLogin;

  ThemeListScreen({required this.teacherLogin});

  @override
  _ThemeListScreenState createState() => _ThemeListScreenState();
}
class _ThemeListScreenState extends State<ThemeListScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Темы'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<Widget>>(
            future: getTopicsForTeacher(widget.teacherLogin),
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