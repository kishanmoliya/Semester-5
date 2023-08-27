import 'package:diploma_projects/secondFile.dart';
import 'package:flutter/material.dart';

class firstScreen extends StatelessWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => secondFile(),
            ),
          );
        },child: Text('Click to navogate'),
      ),
    );
  }
}
