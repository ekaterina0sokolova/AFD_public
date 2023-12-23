import 'package:flutter/material.dart';
import 'package:a_for_dictation/modules/groups_module.dart';

class GroupsInfoScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  List<DataRow> studentRows = [];
  List<DataRow> topicRows = [];
  GroupsInfoScreen({required this.groupId, required this.groupName});

  @override
  Widget build(BuildContext context) {
    TextEditingController _groupnameController =
        TextEditingController(text: groupName);
    return Scaffold(
        appBar: AppBar(title: Text('Редактор группы')),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Группа
              Container(
                height: 95,
                padding: EdgeInsets.fromLTRB(30.0, 45.0, 30.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _groupnameController,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              // Ученики
              Container(
                height: 250,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2),
                    FutureBuilder<List<DataRow>>(
                      future: getStudents(groupId),
                      builder: (BuildContext context,
                          snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          studentRows = snapshot.data!;
                          return DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                'Ученики',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                            ],
                            rows: studentRows,
                          );
                        } else {
                          return Text('No data');
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Темы
              Container(
                height: 250,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2),
                    FutureBuilder<List<DataRow>>(
                      future: getTopics(groupId),
                      builder: (BuildContext context,
                          snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          topicRows = snapshot.data!;
                          return DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                'Темы',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                            ],
                            rows: topicRows,
                          );
                        } else {
                          return Text('No data');
                        }
                      },
                    ),
                  ],
                ),
              )
            ])));
  }
}
