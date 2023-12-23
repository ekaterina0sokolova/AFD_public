import 'package:a_for_dictation/pages/student/exercise_page.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  final String themeId;
  final String themeName;
  int answersCount;
  int correctAnswersCount;
  List<String> args;
  late double result = (correctAnswersCount / answersCount) * 100;

  ResultScreen({required this.themeId, required this.themeName, required this.answersCount, required this.correctAnswersCount, required this.args});
  @override
  Widget build(BuildContext context) {
    Color btnColor = Color(0xFFDAC8EF);
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column (
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // звезды
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Image.asset(result < 50 ? "assets/empty_star_icon.png" : "assets/colored_star_icon.png"),
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(result < 75 ? "assets/empty_star_icon.png" : "assets/colored_star_icon.png"),
                              height: 250,
                              width: 150,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Image.asset(result < 96 ? "assets/empty_star_icon.png" : "assets/colored_star_icon.png"),
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // результат
                    Text("Результат: $correctAnswersCount/$answersCount", style: TextStyle(fontSize: 26.0),)
                  ],
                ),

              ),

              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                            fixedSize: Size(320, 50),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ExerciseScreen(themeId: themeId, themeName: themeName, args: args)));
                          },
                          child: Text('К упражнениям', style: TextStyle(fontSize: 23.0),)),
                    ],
                ),
              )
            ]
        )
      ),
    );
  }
}