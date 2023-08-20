import 'package:flutter/material.dart';

class TextFormFieldProperty extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field Properties"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: nameController,
          onChanged: (value) => print(value),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter Something"
          ),
        ),
      ),
    );
  }
}
