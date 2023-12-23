import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/authentication_page.dart';
import 'package:a_for_dictation/data_base.dart';

void main() {
  runApp(const AFDApp());
}

class AFDApp extends StatelessWidget {
  const AFDApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    createDatabase();
    return MaterialApp(
      title: 'A for dictation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(title: 'A for dictation'),
    );
  }
}




