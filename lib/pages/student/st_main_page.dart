import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/student/glossary_page.dart';
import 'package:a_for_dictation/pages/student/profile_page.dart';
import 'package:a_for_dictation/pages/student/theme_page.dart';

class StMainScreen extends StatefulWidget {
  const StMainScreen({super.key, required this.args});
  final List<String> args;

  @override
  _StMainScreenState createState() => _StMainScreenState(args: args);
}

class _StMainScreenState extends State<StMainScreen> {
  List<String> args;
  _StMainScreenState({required this.args});

  int _selectedIndex = 0;
  Color navBarColor = Color(0xFFDCF7F6);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ThemeScreen(studentLogin: args[0], args: args),
      GlossaryScreen(),
      ProfileScreen(args: args),
    ];

    return MaterialApp(
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(_selectedIndex == 0 ? 'assets/theme_icon_dark.png' : 'assets/theme_icon.png'),
              label: 'Темы',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_selectedIndex == 1 ? 'assets/vocab_icon_dark.png' : 'assets/vocab_icon.png'),
              label: 'Словарь',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_selectedIndex == 2 ? 'assets/lk_icon_dark.png' : 'assets/lk_icon.png'),
              label: 'ЛК',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: navBarColor,
        ),
      ),
    );
  }
}