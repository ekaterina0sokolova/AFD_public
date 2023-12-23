import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/exercise_page.dart';

class ThemeWidget extends StatelessWidget {
  final String themeId;
  final String themeName;
  final String themeData;
  final List<String> args;

  ThemeWidget({required this.themeId, required this.themeName, required this.themeData, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE2D0FD), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ExerciseScreen(args: this.args, themeId: this.themeId, themeName: this.themeName)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this.themeName,
              style: TextStyle(
                color: Color(0xFF234C6D),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 44,
              width: 160,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF94E4E0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                this.themeData,
                style: TextStyle(
                  color: Color(0xFF234C6D),
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}