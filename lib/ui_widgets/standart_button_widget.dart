import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/quiz_page.dart';

class StButtonWidget extends StatelessWidget {
  final String textData;
  final String themeName;
  final String themeId;
  final List<String> args;

  StButtonWidget({required this.textData, required this.themeId, required this.themeName, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: ElevatedButton(
        onPressed: () {
          if (this.textData == "Викторина")
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    QuizScreen(themeId: this.themeId, themeName: this.themeName, args: this.args)));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC8EF)),
          minimumSize: MaterialStateProperty.all<Size>(Size(320, 50)),
        ),
        child: Text(
          this.textData,
          style: TextStyle(
            color: Color(0xFF234C6D),
          fontSize: 19,
          fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}