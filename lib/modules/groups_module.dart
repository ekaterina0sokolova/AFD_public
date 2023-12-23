import 'package:flutter/material.dart';
import 'package:a_for_dictation/db_controllers/groups_controller.dart';
import 'package:a_for_dictation/ui_widgets/group_widget.dart';

Future<List<Widget>> getGroups() async {
  List<Map<String, dynamic>> groups = await getGroupsData();

  Map<String, String> groupData = {};
  List<Widget> groupWidgetList = [];

  for (var group in groups)
  {
    groupData.addAll({group["group_id"].toString(): group["name"]});
  }
  for(final element in groupData.entries)
  {
    groupWidgetList.add(GroupWidget(groupId: element.key, groupName: element.value));
  }
  return groupWidgetList;
}

Future<List<DataRow>> getStudents(String groupId) async {
  List<String> listOfStudents = [];
  List<DataRow> studentRows = [];
  Color rowColor = Color(0xFFF6EEFF);
  List<Map<String, dynamic>> students = await getListOfStudents(groupId);
  for (var student in students) {
    listOfStudents.add(student['student']);
  }
  studentRows.add(
    DataRow(
      color: MaterialStateColor.resolveWith((states) => rowColor),
      cells: [
        DataCell(Text(
          listOfStudents.last,
          style: TextStyle(fontSize: 18),
        ))
      ],
    ),
  );
  return studentRows;
}

Future<List<DataRow>> getTopics(String groupId) async {
  List<String> listOfTopics = [];
  List<DataRow> topicRows = [];
  Color rowColor = Color(0xFFF6EEFF);
  List<Map<String, dynamic>> topics = await getListOfTopics(groupId);
  for (var topic in topics) {
    listOfTopics.add(topic['name']);

    topicRows.add(
      DataRow(
        color: MaterialStateColor.resolveWith((states) => rowColor),
        cells: [
          DataCell(Text(listOfTopics.last, style: TextStyle(fontSize: 18)))
        ],
      ),
    );
  }
  print('topicRows: $topicRows');
  return topicRows;
}