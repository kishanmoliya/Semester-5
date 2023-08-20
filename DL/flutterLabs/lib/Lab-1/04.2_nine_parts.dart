import 'package:flutter/material.dart';

class NineParts_1_4_2 extends StatelessWidget {
  const NineParts_1_4_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nine Parts Scecond"),
      ),
      body: Row(
        children: [
          Expanded(

            //First Column
            child: Column(
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

          //Second Column
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.grey),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.red),
                ),
                Expanded(
                  child: Container(color: Colors.purpleAccent),
                ),
              ],
            ),
          ),

          //Third Column
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.white),
                ),
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.black87),
                ),
                Expanded(
                  flex: 2,
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
