import 'package:flutter/material.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/screens/pages/prel_login_page.dart';
import 'package:mobile/question_model/quiz_page.dart';
import 'package:mobile/screens/pages/result_page.dart';

import '../screens/pages/home.dart';
import '../screens/pages/profile.dart';
import '../screens/pages/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      const HomePage(),
      const SearchPage(),
      const UserProfile(),
    ];

    void onTappedItem(int index) {
      setState(() {
        _selectedItem = index;
      });
    }

    return Scaffold(
      body: widgetOptions[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF5F5FA),
          onTap: onTappedItem,
          elevation: 10,
          currentIndex: _selectedItem,
          selectedItemColor: const Color(0xff2EBA64),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(color: Color(0xff2EBA64)),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
