import 'dart:math';
import 'package:flutter/material.dart';

class LudoDice extends StatefulWidget {
  const LudoDice({Key? key}) : super(key: key);

  @override
  State<LudoDice> createState() => _LudoDiceState();
}

class _LudoDiceState extends State<LudoDice> {
  int i = Random().nextInt(6)+1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text("Ludo Dice"),
      ),
      body: TextButton(
        onPressed: () {
          setState((){
            i = Random().nextInt(6)+1;
          });
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Image.asset('assets/images/dice$i.png'),
          ),
        ),
      ),
    );
  }
}
