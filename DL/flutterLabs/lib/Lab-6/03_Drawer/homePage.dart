import 'package:diploma_projects/Lab-6/Drawer/DrawerDemo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: DrawerDemo(),
      body: Center(
        child: Text('Home Page!'),
      ),
    );
  }
}
