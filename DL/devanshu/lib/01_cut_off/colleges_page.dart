import 'package:devanshu/college_details_page.dart';
import 'package:devanshu/database/DatabaseHelper_CutOffPage.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class CollegesPage extends StatefulWidget {
  CollegesPage(
      {Key? key,
        required this.meritNo,
      required this.board,
      required this.branches,
      required this.category,
      required this.collegeType,
      required this.quota})
      : super(key: key);

  int meritNo;
  String board;
  String branches;
  int category;
  int collegeType;
  int quota;

  @override
  State<CollegesPage> createState() => _CollegesPageState();
}

class _CollegesPageState extends State<CollegesPage> {
  TextEditingController searchBarController = TextEditingController();
  CustomUtilities utilities = CustomUtilities();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.length);
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade50,
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 15),
                    child: TextFormField(
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
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [
                        Container(
                          width: utilities.screenWidth * 0.15,
                          child: Text("Course"),
                        ),
                        Container(
                          width: utilities.screenWidth * 0.65,
                          child: Text(
                            "College",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: utilities.screenWidth * 0.12,
                          child: Text("Closing"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CollegeDetailsPage(
                                  collegeID: snapshot.data[index]["CollegeID"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: (index % 2 == 0)
                                  ? Colors.white
                                  : utilities.backgroundLightGreyColor,
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: utilities.screenWidth * 0.15,
                                  child:
                                      Text(snapshot.data[index]["DegreeName"]),
                                ),
                                Container(
                                  width: utilities.screenWidth * 0.65,
                                  child: Text(
                                    snapshot.data[index]["CollegeShortName"],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width: utilities.screenWidth * 0.12,
                                  alignment: Alignment.centerRight,
                                  child: Text(snapshot.data[index]
                                              ["ClosingRank"] !=
                                          null
                                      ? snapshot.data[index]["ClosingRank"]
                                          .toString()
                                      : snapshot.data[index]["ClosingRank1"]
                                          .toString()),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10,
                                  color: utilities.backgroundGreyColor,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data.length,
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("${snapshot.data.length} Records found")),
          );
        } else {
          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false),
          );
        }
      },
      future: DatabaseHelper_CutoffPage().filter_college(
        inputText: searchBarController.text,
        meritno: widget.meritNo,
        collegetype:
            (widget.collegeType == 0) ? "all" : widget.collegeType.toString(),
        category: widget.category,
        quota: 1,
        branches: widget.branches,
        board: widget.board,
      ),
    );
  }
}
