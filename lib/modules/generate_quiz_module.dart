import 'package:a_for_dictation/db_controllers/theme_controller.dart';
import 'dart:math';

// Класс вопроса викторины
class Question {
  String question;
  List<String> options;
  int correctAnswerIndex;

  Question(this.question, this.options, this.correctAnswerIndex);
}

// Формирование списка вопросов
Future<List<Question>> formingQuestionlist(String themeId, bool dataLoaded) async{

  if (dataLoaded == true) return [];
  List<Map<String, dynamic>>vocabList = await getVocabList(themeId);

  Map<String, String> wordsPair = {};
  String questionWord;
  List<String> options = [];
  int correctAnswerIndex;
  List<Question> questionList = [];

  for (var vocab in vocabList) {
      wordsPair.addAll({vocab["word"]: vocab["translation"]});
  }

  List<String> wordsToTranslate = (wordsPair.keys).toList();
  List<String> translations = (wordsPair.values).toList();
  for (var w = 0; w < wordsPair.length; w ++) {
    questionWord = wordsToTranslate[w];
    final random = Random();
    List<int> randNumbers = [];
    correctAnswerIndex = random.nextInt(3);

    while (randNumbers.length < 4) {
      int randomNumber = random.nextInt(wordsPair.length) + 0;
      if (!randNumbers.contains(randomNumber) &&
          translations.elementAt(randomNumber) != wordsPair[questionWord]) {
        randNumbers.add(randomNumber);
      }
    }
    for (var i = 0; i < 4; i++) {
      if (i == correctAnswerIndex) {
        options.add(translations[w]);
      }
      else
        options.add(translations.elementAt(randNumbers[i]));
    }
    questionList.add(Question(questionWord, options, correctAnswerIndex));
    options = [];
  }
  print(questionList);
  return questionList;
}
