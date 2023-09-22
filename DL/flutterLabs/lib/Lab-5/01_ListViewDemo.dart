import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  List<int> numbers = [1,2,3,4,5,6,4,5,6,3,5,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Numbers'),
      ),
      body: ListView(
        children: numbers.map((num) => Text('$num')).toList()
      ),
    );
  }
}
