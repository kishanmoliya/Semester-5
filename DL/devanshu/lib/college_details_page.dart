import 'package:devanshu/database/my_database.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollegeDetailsPage extends StatefulWidget {
  CollegeDetailsPage({required this.collegeID, Key? key}) : super(key: key);
  int collegeID;

  @override
  State<CollegeDetailsPage> createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {
  CustomUtilities utilities = CustomUtilities();
  String? query;

  @override
  void initState() {
    super.initState();
    query = "select " +
        "INS_College.CollegeID," +
        "INS_College.CollegeName," +
        "INS_College.BranchID," +
        "INS_College.CollegeShortName," +
        "INS_College.Address," +
        "INS_College.Phone," +
        "INS_College.Mobile," +
        "INS_College.Website," +
        "INS_College.Email," +
        "INS_College.Fees," +
        "INS_College.CollegeCode," +
        "INS_College.Intake," +
        "FeesMQ," +
        "FeesNRI," +
        "INS_College.Intake_AIQ," +
        "INS_College.Intake_MQ," +
        "INS_College.Intake_NRI," +
        "INS_College.Intake_EWS," +
        "INS_College.Intake_SC," +
        "INS_College.Intake_ST," +
        "INS_College.Intake_SEBC," +
        "INS_College.Intake_Open," +
        "MST_CollegeType.CollegeTypeName," +
        "INS_Branch.BranchShortName," +
        "MST_University.UniversityName" +
        " from " +
        "INS_College" +
        " INNER JOIN MST_CollegeType on INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID" +
        " LEFT OUTER JOIN INS_Branch ON INS_College.BranchID = INS_Branch.BranchID" +
        " LEFT OUTER JOIN MST_University on INS_College.UniversityID = MST_University.UniversityID" +
        " Where " +
        "collegeid =" +
        "${widget.collegeID}" +
        " ORDER BY INS_College.CollegeShortName";
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (snapshot.hasData) {
          print(snapshot.data);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                  "${data[0]["CollegeShortName"]} (${data[0]["CollegeCode"]})"),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(snapshot.data.toString()),
                  // Text("CollegeID" + snapshot.data[0]["CollegeID"].toString()),
                  getCollegeDetails(snapshot.data[0]),
                  getSeatsDistribution(snapshot.data[0]),
                  getFeesPerYear(snapshot.data[0]),
                  getClosingAsPerLastRound(snapshot.data[0]),
                  Container(
                    height: 500,
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: MyDatabase().getCollegeDetails(collegeId: widget.collegeID),
    );
  }

  Widget getCollegeDetails(data) {
    List<Map> map = [
      {"icon": Icons.location_on_sharp, "description": data["Address"]},
      {"icon": Icons.call, "description": data["Phone"]},
      {"icon": FontAwesomeIcons.earthAmericas, "description": data["Website"]},
      {"icon": Icons.mail, "description": data["Email"]},
      {"icon": Icons.group, "description": data["CollegeCode"]},
      {
        "icon": FontAwesomeIcons.buildingColumns,
        "description": data["UniversityName"]
      },
    ];
    List<Widget> columnChildren = [];
    columnChildren.add(
      Container(
        decoration: BoxDecoration(
          color: utilities.lightGreenColor,
        ),
        padding: EdgeInsets.all(6),
        child: BoldText(text: data["CollegeName"], size: 15),
      ),
    );
    for (int i = 0; i < map.length; i++) {
      columnChildren.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(map[i]["icon"], size: 22.0, color: Colors.black),
              ),
              Expanded(
                flex: 9,
                child: CustomText(map[i]["description"],
                    size: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurStyle: BlurStyle.outer,
          blurRadius: 5,
        )
      ]),
      child: Column(
        children: columnChildren,
      ),
    );
  }

  Widget getSeatsDistribution(data) {
    List<Map> list = [
      {"category": "All India Quota", "seat": data["Intake_AIQ"]},
      {"category": "Open", "seat": data["Intake_Open"]},
      {"category": "EWS", "seat": data["Intake_EWS"]},
      {"category": "SEBC", "seat": data["Intake_SEBC"]},
      {"category": "SC", "seat": data["Intake_SC"]},
      {"category": "ST", "seat": data["Intake_ST"]},
      {"category": "Management Quota", "seat": data["Intake_MQ"]},
      {"category": "NRI", "seat": data["Intake_NRI"]},
    ];
    List<Widget> columnChildren = [];
    columnChildren.add(
      Container(
        padding: EdgeInsets.all(6),
        width: double.infinity,
        alignment: Alignment.center,
        child: BoldText(
          text: "Seats Distribution",
        ),
      ),
    );
    columnChildren.add(
      Container(
          color: utilities.lightGreenColor,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [CustomText("Category"), CustomText("Seats")],
          )),
    );
    for (int i = 0; i < list.length; i++) {
      columnChildren.add(
        Container(
          color: (i % 2 == 0) ? Color.fromRGBO(245, 245, 245, 1) : Colors.white,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(list[i]["category"]),
              CustomText(list[i]["seat"]),
            ],
          ),
        ),
      );
    }
    columnChildren.add(
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Total"),
            CustomText(data["Intake"]),
          ],
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurStyle: BlurStyle.outer,
          blurRadius: 5,
        )
      ]),
      child: Column(
        children: columnChildren,
      ),
    );
  }

  Widget getFeesPerYear(data) {
    List<Widget> columnChildren = [];
    columnChildren.add(
      Container(
        padding: EdgeInsets.all(6),
        width: double.infinity,
        alignment: Alignment.center,
        child: BoldText(
          text: "Fees Per Year (2022)",
        ),
      ),
    );
    List<Widget> rowChildren = [];
    List quotas = [
      {"quota": "GQ Quota", "fees": data["Fees"]},
      {"quota": "MQ", "fees": data["FeesMQ"]},
      {"quota": "NRIQ", "fees": data["FeesNRI"]}
    ];
    for (int i = 0; i < quotas.length; i++) {
      if (i + 1 != quotas.length) {
        rowChildren.add(
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: utilities.lightGreenColor,
                border: Border(
                  right: BorderSide(color: Colors.grey),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: CustomText(
                      quotas[i]["quota"],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CustomText("\u{20B9}" + quotas[i]["fees"],
                        color: Colors.grey),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        rowChildren.add(
          Expanded(
            child: Container(
              color: utilities.lightGreenColor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: CustomText(
                      quotas[i]["quota"],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CustomText(quotas[i]["fees"], color: Colors.grey),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
    columnChildren.add(Row(
      children: rowChildren,
    ));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurStyle: BlurStyle.outer,
          blurRadius: 5,
        )
      ]),
      child: Column(
        children: columnChildren,
      ),
    );
  }

  Widget getClosingAsPerLastRound(data) {
    List<Widget> columnChildren = [];
    columnChildren.add(
      Container(
        padding: EdgeInsets.all(6),
        width: double.infinity,
        alignment: Alignment.center,
        child: BoldText(
          text: "Closing as per Admission-2022 Last Round",
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurStyle: BlurStyle.outer,
          blurRadius: 5,
        )
      ]),
      child: Column(
        children: columnChildren,
      ),
    );
  }
}
