import 'package:devanshu/college_details_page.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class CollegesClassificationPage extends StatefulWidget {
  CollegesClassificationPage(
      {Key? key, required this.title, required this.branchID})
      : super(key: key);
  String title;
  int branchID;

  @override
  State<CollegesClassificationPage> createState() =>
      _CollegesClassificationPageState();
}

class _CollegesClassificationPageState extends State<CollegesClassificationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  CustomUtilities utilities = CustomUtilities();
  TextEditingController searchBarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
        future: MyDatabase().getCollegesClassificationByCourses(
            branchID: widget.branchID, text: searchBarController.text),
        builder: (context, snapshot) {
          int a = 0;
          int b = 0;
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data.length; i++) {
              if (snapshot.data[i]["CollegeTypeID"] == 1) {
                a++;
              } else {
                b++;
              }
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                    "Colleges (${(_tabController.index == 0) ? a + b : (_tabController.index == 1 ? a : b)}) "),
              ),
              body: Column(
                children: [
                  Container(
                      height: 50,
                      color: utilities.lightGreenColor,
                      child: TabBar(
                        controller: _tabController,
                        physics: const ClampingScrollPhysics(),
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "GOV.",
                          ),
                          Tab(
                            text: "SFI",
                          )
                        ],
                      ),
                    ),
                  Container(
                    color: Colors.black12,
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 10),
                    child: TextFormField(
                      onTap: () {},
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: searchBarController,
                      decoration: InputDecoration(
                          hintText: "Search",
                          contentPadding: EdgeInsets.only(left: 10, top: 15)),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView(
                          children: getListChildren(snapshot.data, "all"),
                        ),
                        ListView(
                          children: getListChildren(snapshot.data, "gov"),
                        ),
                        ListView(
                          children: getListChildren(snapshot.data, "sfi"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        });
  }

  List<Widget> getListChildren(data, String s) {
    List<Widget> list = [];
    if (s == "all") {
      for (int i = 0; i < data.length; i++) {
        list.add(getRow(data[i]));
      }
    } else if (s == "gov") {
      for (int i = 0; i < data.length; i++) {
        if (data[i]["CollegeTypeID"] == 1) {
          list.add(getRow(data[i]));
        }
      }
    } else if (s == "sfi") {
      for (int i = 0; i < data.length; i++) {
        if (data[i]["CollegeTypeID"] == 2) {
          list.add(getRow(data[i]));
        }
      }
    }
    return list;
  }

  Widget getRow(data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollegeDetailsPage(
              collegeID: data["CollegeID"],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
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
                    text: '${data["CollegeShortName"]}',
                  ),
                  (data["FeesMQ"].toString() != "")
                      ? CustomText(
                          'Seats: ${data["Intake"]}   Fees: ${data["Fees"]}  MQ: ${data["FeesMQ"].toString()}')
                      : CustomText(
                          'Seats: ${data["Intake"]}   Fees: ${data["Fees"]}'),
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
    );
  }
}
