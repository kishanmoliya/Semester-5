import 'package:flutter/material.dart';

class TextFormFieldProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field Properties"),
      ),
      body: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter Something",
          label: Text('name'),
        ),
      ),
    );
  }
}
