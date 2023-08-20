import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devanshu/database/my_database.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({Key? key, this.board}) : super(key: key);
  final board;

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scholarship"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: [
                Html(
                  data: snapshot.data[0]["HTMLValue"].toString(),
                  style: {
                    "body": Style(
                      textAlign: TextAlign.justify,
                      fontSize: FontSize(12),
                    ),
                  },
                  onAnchorTap: (url, context, attributes, element) {
                    dynamic uri = Uri.parse("https:${url}");
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ]);
            } else {
              return CircularProgressIndicator();
            }
          },
          future: MyDatabase().getScholarship(board: widget.board)),
    );
  }
}
