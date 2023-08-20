import 'package:flutter/material.dart';

class BirthdayCard extends StatefulWidget {
  @override
  _BirthdayCardState createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {
  String name = "Darshan";

  void _showBirthdayCardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Customize Birthday Card"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birthday Card"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/birthday.png",
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Happy Birthday, $name!",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showBirthdayCardDialog();
                    },
                    child: const Text("Customize"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
