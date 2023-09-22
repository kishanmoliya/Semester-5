import 'package:flutter/material.dart';

class ListViewBuilderDemo extends StatelessWidget {
  List<int> numbers = [1, 2, 8, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Number'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Text('${numbers[index]}');
        },
      ),
    );
  }
}
