import 'package:flutter/material.dart';
import 'package:a_for_dictation/db_controllers/theme_controller.dart';

Future<List<DataRow>> prepareDataTableRows() async {
  List<DataRow> rows = [];
  List<String> words = [];
  List<String> translations = [];
  List<String> topicNames = [];
  List<List<Map<String, dynamic>>> tableShow = await getData();
  for (var topic in (tableShow[3])) {
    Color rowColor = Color(0xFFDAC8EF);
    int topicId = topic['topic_id'];
    topicNames.add(topic['name']);
    rows.add(
      DataRow(
        color: MaterialStateColor.resolveWith((states) => rowColor),
        cells: [
          DataCell(Text(topicNames.last)),
          DataCell(Text('')),
        ],
      ),
    );
    for (var pair in (tableShow[4])) {
      int pairTopicId = pair['topic_id'];
      words.add(pair['word']);
      translations.add(pair['translation']);
      Color tableColor = Color(0xFFF6EEFF); // Здесь можно изменить цвет в HEX формате
      if (topicId == pairTopicId) { // Проверяем соответствие ID темы и слова
        rows.add(
          DataRow(
            color: MaterialStateColor.resolveWith((states) => tableColor),
            cells: [
              DataCell(Text(words.last)),
              DataCell(Text(translations.last)),
            ],
          ),
        );
      }
    }
  }
  return rows;
}