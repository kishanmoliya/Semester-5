import 'package:diploma_projects/Lab-2/06_second_screen.dart';
import 'package:flutter/material.dart';

class NamedRouting extends StatefulWidget {
  const NamedRouting({Key? key}) : super(key: key);

  @override
  State<NamedRouting> createState() => _NamedRoutingState();
}

class _NamedRoutingState extends State<NamedRouting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Routing First Screen"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text("Click to Navigate")),
      ),
    );
  }
}
