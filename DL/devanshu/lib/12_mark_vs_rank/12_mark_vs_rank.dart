import 'package:devanshu/database/my_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';

class MarkVsRankPage extends StatefulWidget {
  const MarkVsRankPage({Key? key}) : super(key: key);

  @override
  State<MarkVsRankPage> createState() => _MarkVsRankPageState();
}

class _MarkVsRankPageState extends State<MarkVsRankPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Mark vs Rank",
              ),
              automaticallyImplyLeading: false,
            ),
            body: ListView(
              children: [
                // Text(snapshot.data.toString()),
                Html(
                  data: snapshot.data[0]["HTMLValue"].toString(),

                ),
              ],
            ),
          );
        }
        return Container(
          child: CircularProgressIndicator(),
        );
      },
      future: MyDatabase().getMarkVsRank(),
    );
  }
}
