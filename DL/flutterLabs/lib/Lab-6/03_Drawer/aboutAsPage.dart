import 'package:diploma_projects/Lab-6/Drawer/DrawerDemo.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      drawer: DrawerDemo(),
      body: Center(
        child: Text('About Page.'),
      ),
    );
  }
}