import 'package:a_for_dictation/ui_widgets/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/result_page.dart';
import 'package:a_for_dictation/modules/generate_quiz_module.dart';


class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.themeId, required this.themeName, required this.args});
  final String themeName;
  final String themeId;
  final List<String> args;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final String themeName;
  late final String themeId;
  late final List<String> args;
  // late final List<Question> questions;

  @override
  void initState() {
    themeName = widget.themeName;
    themeId = widget.themeId;
    args = widget.args;
    super.initState();
  }

  int currentQuestionIndex = 0;
  List<Question>? _questions = [];
  bool _dataLoaded = false;
  int score = 0;
  Color btnColor = Color(0xFFDAC8EF);
  List<Color> btnColors = [Color(0xFFDAC8EF), Color(0xFFDAC8EF), Color(0xFFDAC8EF), Color(0xFFDAC8EF)];

  void checkAnswer(int selectedIndex, int ansCount, List<Question> questions) {
    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score++;
      setState(() {
        btnColors[selectedIndex] = Color(0xFF8AFCCC);
      });
    } else {
      setState(() {
        btnColors[selectedIndex] = Color(0xFFF88686);
      });
    }
    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(() {
        btnColors[selectedIndex] = Color(0xFFDAC8EF);
      });
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                ResultScreen(
                    themeId: this.themeId,
                    themeName: this.themeName,
                    answersCount: ansCount,
                    correctAnswersCount: score,
                  args: this.args,
                )
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Викторина ' + this.themeName),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<Question>>(
          future: formingQuestionlist(themeId, _dataLoaded),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    if (this._dataLoaded == false) {
                      this._questions = snapshot.data!;
                      this._dataLoaded = true;
                    }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          _questions![currentQuestionIndex].question,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _questions![currentQuestionIndex].options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              title: QuizWidget(textData: _questions![currentQuestionIndex].options[index], btnColor: btnColors[index]),
                              onTap: () {
                                checkAnswer(index, _questions!.length, _questions!);
                              }
                          );
                        },
                      ),
                    ],
                  ),
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
