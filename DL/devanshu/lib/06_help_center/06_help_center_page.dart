import 'package:devanshu/06_help_center/city_wise_help_centers_page.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({Key? key, required this.board}) : super(key: key);
  final String board;

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  CustomUtilities utilities = CustomUtilities();
  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Help Center (${snapshot.data.length})"),
            ),
            body: Column(
              children: [
                Container(
                  color: Colors.black12,
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
                  child: TextFormField(
                    onTap: () {},
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: searchBarController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 10, top: 15),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityWiseHelpCentersPage(
                                        city: snapshot.data[index]["City"],
                                        board: widget.board,
                                      )));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: (index % 2 == 0)
                                  ? Colors.white
                                  : utilities.backgroundLightGreyColor),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoldText(
                                  text: snapshot.data[index]["District"] +
                                      "(" +
                                      snapshot.data[index]["count"].toString() +
                                      ")",
                                  size: 18.0,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded)
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black12))),
                            // trailing: Text(),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text("Help Center")),
          );
        }
      },
      future: MyDatabase()
          .getHelpCenters(text: searchBarController.text, board: widget.board),
    );
  }
}
