// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:a_for_dictation/pages/authentication_page.dart';
import 'package:a_for_dictation/pages/student/exercise_page.dart';
import 'package:a_for_dictation/pages/student/quiz_page.dart';
import 'package:a_for_dictation/pages/student/st_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:a_for_dictation/main.dart';

void main() {
  group("Testing Buttons screen", () {
    testWidgets("Testing popup menu", (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: AuthenticationScreen(title: "A for dictation"),
      ));
      expect(find.text("Email"), findsOneWidget);
      expect(find.text("Пароль"), findsOneWidget);
    });
  });
}
