import 'package:a_for_dictation/ui_widgets/theme_widget.dart';
import 'package:a_for_dictation/ui_widgets/theme_tch_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:a_for_dictation/db_controllers/theme_controller.dart';


Future<List<Widget>> getTopicsForStudent(String login, List<String> args) async {
  List<Map<String, dynamic>> themes = await getTopicsListForStudent(login);

  Map<String, List<String>> themeData = {};
  List<Widget> themeWidgetList = [];

  for (var theme in themes)
  {
    themeData.addAll({theme["topic_id"].toString(): [theme["name"], theme["deadline"]]});
  }
  for(final element in themeData.entries)
  {
    themeWidgetList.add(ThemeWidget(args: args, themeId: element.key, themeName: element.value[0], themeData: element.value[1]));
  }
  return themeWidgetList;
}

Future<List<Widget>> getTopicsForTeacher(String login) async {
  List<Map<String, dynamic>> themes = await getTopicsListForTeacher(login);

  Map<String, List<String>> themeData = {};
  List<Widget> themeWidgetList = [];

  for (var theme in themes)
  {
    themeData.addAll({theme["topic_id"].toString(): [theme["name"], theme["deadline"]]});
  }
  for(final element in themeData.entries)
  {
    themeWidgetList.add(ThemeTchListWidget(themeId: element.key, themeName: element.value[0], themeData: element.value[1]));
  }
  return themeWidgetList;
}