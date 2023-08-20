import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar."),
      ),
      body: Stack(
        children: const [
          Image(
            image: AssetImage('assets/images/person.jfif'),
          ),
          Text("It's Possible Using Stack Widget !",style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
