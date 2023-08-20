import 'package:devanshu/03_courses/colleges_classification_page.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';
class CoursePage extends StatefulWidget {
  CoursePage({Key? key, required this.board}) : super(key: key);
  String board;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  TextEditingController searchBarController = TextEditingController();
  CustomUtilities utilities = CustomUtilities();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Cources (${snapshot.data.length})"),
            ),
            body: Container(
              decoration: BoxDecoration(color: utilities.backgroundGreyColor),
              child: ListView(
                children: getListViewChildren(snapshot.data),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: MyDatabase().getCourses(
        board: widget.board,
        text: searchBarController.text,
      ),
    );
  }

  List<Widget> getListViewChildren(data) {
    List<Widget> list = [];
    list.add(
      Container(
        color: Colors.black12,
        padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
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
    );
    for (int i = 0; i < data.length; i++) {
      list.add(
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollegesClassificationPage(
                  title: '${data[i]["BranchName"]} ',
                  branchID: int.parse(data[i]["BranchID"].toString()),
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  width: utilities.screenWidth * 0.94,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        text:
                            '${data[i]["BranchName"]} (${data[i]["DegreeName"]})',
                      ),
                      FutureBuilder(
                        builder: (cxt, snt) {
                          if (snt.hasData) {
                            if (snt.data.length == 2) {
                              int college =
                                  snt.data[0]["count"] + snt.data[1]["count"];
                              int seats = snt.data[0]["a"] + snt.data[1]['a'];
                              return Text(
                                  "Colleges: $college, Seats: $seats [ Gov: ${snt.data[0]["a"]}, SFI: ${snt.data[1]['a']} ]");
                            } else if (snt.data.length == 1 &&
                                snt.data[0]["CollegeTypeID"] == 1) {
                              return Text(
                                  "Colleges: ${snt.data[0]["count"]}, Seats: ${snt.data[0]["a"]} [ Gov: ${snt.data[0]["a"]}, SFI: 0 ]");
                            } else if (snt.data.length == 1 &&
                                snt.data[0]["CollegeTypeID"] == 2) {
                              return Text(
                                  "Colleges: ${snt.data[0]["count"]}, Seats: ${snt.data[0]["a"]} [ Gov: 0, SFI: ${snt.data[0]["a"]} ]");
                            } else {
                              return Container();
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                        future: MyDatabase().anyQuery(
                            "Select BranchID,CollegeTypeID, count(*) as count, sum(Intake) as a from INS_College group by BranchID,CollegeTypeID having BranchID = ${data[i]["BranchID"]}"),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
      );
    }

    return list;
  }
}
