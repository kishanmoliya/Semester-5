import 'package:flutter/material.dart';

class TextWidgetProperties extends StatelessWidget {
  const TextWidgetProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Widget Properties"),
      ),
      body: const Text(
        "Hello World",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.purple,
          backgroundColor: Colors.grey
        ),
      ),
    );
  }
}
