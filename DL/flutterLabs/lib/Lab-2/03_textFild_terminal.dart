import 'package:flutter/material.dart';

class PrintTextTerminal extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field"),
      ),
      body: TextFormField(
        controller: nameController,
          onChanged: (value) => print(value),
      ),
    );
  }
}
