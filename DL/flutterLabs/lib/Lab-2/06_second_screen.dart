import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           Navigator.pop(context);
          },
          child: const Text("Chick to Back"),
        ),
      ),
    );
  }
}
