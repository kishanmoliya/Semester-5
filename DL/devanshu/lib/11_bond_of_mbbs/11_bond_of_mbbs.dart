import 'package:devanshu/database/my_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BondOfMbbsPage extends StatefulWidget {
  const BondOfMbbsPage({Key? key}) : super(key: key);

  @override
  State<BondOfMbbsPage> createState() => _BondOfMbbsPageState();
}

class _BondOfMbbsPageState extends State<BondOfMbbsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, title: Text("Bond of MBBS")),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(5),
                child: Html(
                  data: snapshot.data[0]["HTMLValue"].toString(),
                  style: {
                    "body": Style(
                      textAlign: TextAlign.justify,
                      fontSize: FontSize(16),
                    )
                  },
                ),
              );
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          future: MyDatabase().anyQuery(
              "Select HTMLValue from MST_HTML where HTMLName = 'MBBSBond'"),
        ));
  }
}
