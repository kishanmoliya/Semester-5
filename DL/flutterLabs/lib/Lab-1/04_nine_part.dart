import 'package:flutter/material.dart';

class NineParts_1_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nine Parts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.green),
                ),
                Expanded(
                  child: Container(color: Colors.blue),
                ),
                Expanded(
                  child: Container(color: Colors.yellow),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.pinkAccent),
                ),
                Expanded(
                  child: Container(color: Colors.red),
                ),
                Expanded(
                  child: Container(color: Colors.purpleAccent),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.white),
                ),
                Expanded(
                  child: Container(color: Colors.black87),
                ),
                Expanded(
                  child: Container(color: Colors.cyan),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
