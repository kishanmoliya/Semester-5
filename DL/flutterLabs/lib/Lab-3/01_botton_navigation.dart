import 'package:diploma_projects/Lab-1/04.2_nine_parts.dart';
import 'package:diploma_projects/Lab-1/04_nine_part.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    NineParts_1_4(),
    NineParts_1_4_2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room, ),
            label: "Lab Programs",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phonelink_rounded),
            label: "Projects",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

