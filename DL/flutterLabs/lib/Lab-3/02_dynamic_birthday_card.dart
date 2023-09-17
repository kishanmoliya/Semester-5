import 'package:flutter/material.dart';

class BirthdayCard extends StatefulWidget {
  @override
  _BirthdayCardState createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {
  String name = "Darshan";
  TextEditingController nameController = new TextEditingController();

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
              child: Row(
            children: [
              Text("Happy BirthDay ${nameController.text}"),
              TextField(
                onSubmitted: (value) {
                  setState(() {});
                },
                controller: nameController,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
