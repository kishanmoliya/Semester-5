import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:devanshu/database/my_database.dart';

class KeyDates extends StatefulWidget {
  const KeyDates({Key? key, this.board}) : super(key: key);
  final board;

  @override
  State<KeyDates> createState() => _KeyDatesState();
}

class _KeyDatesState extends State<KeyDates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key Dates"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            return Html(data: snapshot.data[0]["HTMLValue"].toString());
          } else {
            return Container(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: MyDatabase().getKeyDates(board: widget.board),
      ),
    );
  }
}
