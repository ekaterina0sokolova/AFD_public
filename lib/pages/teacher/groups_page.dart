import 'package:flutter/material.dart';
import 'package:a_for_dictation/modules/groups_module.dart';

class GroupsScreen extends StatefulWidget {
  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}
class _GroupsScreenState extends State<GroupsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Группы')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<Widget>>(
            future: getGroups(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List<Widget> groupsListWidgets = snapshot.data!;
                return ListView.builder(
                  itemCount: groupsListWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return groupsListWidgets[index];
                  },
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