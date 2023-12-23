import 'package:flutter/material.dart';
import 'package:a_for_dictation/pages/teacher/profile_page.dart';
import 'package:a_for_dictation/pages/teacher/theme_list_page.dart';
import 'package:a_for_dictation/pages/teacher/groups_page.dart';

class TchMainScreen extends StatefulWidget {
  const TchMainScreen({super.key, required this.args});
  final List<String> args;

  @override
  _TchMainScreenState createState() => _TchMainScreenState(args: args);
}

class _TchMainScreenState extends State<TchMainScreen> {
  List<String> args;
  _TchMainScreenState({required this.args});

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
      ThemeListScreen(teacherLogin: args[0]),
      // RequestsScreen(),
      GroupsScreen(),
      TchProfileScreen(args: args),
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
            // BottomNavigationBarItem(
            //   icon: Image.asset(_selectedIndex == 1 ? 'assets/requests_icon_dark.png' : 'assets/requests_icon.png'),
            //   label: 'Заявки',
            // ),
            BottomNavigationBarItem(
              icon: Image.asset(_selectedIndex == 1 ? 'assets/groups_icon_dark.png' : 'assets/groups_icon.png'),
              label: 'Группы',
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