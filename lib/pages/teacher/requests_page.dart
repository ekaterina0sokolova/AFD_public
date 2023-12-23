import 'package:flutter/material.dart';
import 'package:a_for_dictation/data_base.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}
class _RequestsScreenState extends State<RequestsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заявки')),
    );
  }
}