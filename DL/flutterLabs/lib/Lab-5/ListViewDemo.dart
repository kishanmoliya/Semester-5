import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  List<int> numbers = [1, 2, 8, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Number'),
      ),
      body: ListView(
        children: numbers
            .map(
              (number) => ListTile(
                title: Text('$numbers'),
              ),
            )
            .toList(),
      ),
    );
  }
}
