import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CodingPage.dart';
import 'CommunicationPages.dart';
import 'ParentDashBoardPage.dart';
import 'ParentProfilePage.dart';
import 'ResourcesPage.dart';
import 'TransportPage.dart';

class Parentshomepage extends StatefulWidget {
  const Parentshomepage({super.key});

  @override
  State<Parentshomepage> createState() => _ParentshomepageState();
}

class _ParentshomepageState extends State<Parentshomepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Parentdashboardpage(),
    Codingpage(),
    Resourcespage(),
    TransportPage(),
    //Parentprofilepage(),
    Communicationpages(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.disabledColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code_outlined),
            activeIcon: Icon(Icons.code),
            label: "Coding",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: "Resources",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: "Transport",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            activeIcon: Icon(Icons.chat_bubble),
            label: "Communication",
          ),
        ],
      ),
    );
  }
}
