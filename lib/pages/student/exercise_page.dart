import 'package:flutter/material.dart';
import 'package:a_for_dictation/ui_widgets/standart_button_widget.dart';
import 'package:a_for_dictation/pages/student/st_main_page.dart';

class ExerciseScreen extends StatelessWidget {
  final String themeId;
  final String themeName;
  final List<String> args;

  ExerciseScreen({required this.themeId, required this.themeName, required this.args});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
      //Замена события
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StMainScreen(args: this.args)));
      return false;
    },
    child:
      Scaffold(
      appBar: AppBar(title: Text(this.themeName)),
      body: Center(
          child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 120.0),
                  child: Text(
                    "Упражнения по теме\n" + this.themeName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF234C6D),
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                StButtonWidget(args: this.args, themeId: this.themeId, themeName: this.themeName, textData: "Соедини слова"),
                StButtonWidget(args: this.args, themeId: this.themeId,themeName: this.themeName, textData:"Викторина"),
                StButtonWidget(args: this.args, themeId: this.themeId,themeName: this.themeName, textData:"Карточки"),
              ]
          )
      ),
    ));
  }
}