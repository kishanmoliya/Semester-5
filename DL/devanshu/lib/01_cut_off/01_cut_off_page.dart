import 'package:devanshu/01_cut_off/colleges_page.dart';
import 'package:devanshu/util/custom_alert_dialog.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class CutOffPage extends StatefulWidget {
  CutOffPage({Key? key, required this.board}) : super(key: key);
  String? board;

  @override
  State<CutOffPage> createState() => _CutOffPageState();
}

class _CutOffPageState extends State<CutOffPage> {
  CustomUtilities utilities = CustomUtilities();

  // This merit types values are only for medical cutoff page
  List<String> meritDropdownList = ["Merit No.", "NEET Mark", "AIR"];
  String? selectedValueForMeritType;

  // College Types
  List<String> collegeTypes = ["All", "Gov.", "SFI"];
  String? selectedValueForCollegeType;

  // Category List
  List<String> categoryList = ["OPEN", "EWS", "SEBC", "SC", "ST"];
  String? selectedValueForCategory;

  // Courses
  Map<String, bool> courses = {};

  // Map<String, bool>? allClear;

  int? radioButton;
  final _formKey = GlobalKey<FormState>();
  TextEditingController meritController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValueForMeritType = meritDropdownList[0];
    selectedValueForCollegeType = collegeTypes[0];
    selectedValueForCategory = categoryList[0];

    if (widget.board == "HSC") {
      courses = {
        "Physiotherapy": true,
        "Nursing": true,
        "Orthotics": true,
        "Optometry": true,
        "Naturopathy": true,
        "GNM": true,
        "ANM": true,
        "Occupational": true,
        "Audiology": true,
      };
    } else {
      courses = {
        "MBBS": true,
        "Dental": true,
        "Ayurvedic": true,
        "Homeopathy": true
      };
    }
    // allClear = {"All": true, "clear": false};
    radioButton = 1;
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Search Cutoff"),
      ),
      body: Container(
        color: utilities.backgroundGreyColor,
        padding: EdgeInsets.all(5),
        child: Form(
          key: _formKey,
          child: ListView(
            children: getListViewChildren(widget.board),
          ),
        ),
      ),
    );
  }

  List<Widget> getListViewChildren(board) {
    double blurRadius = 0.5;
    List<Widget> list = [];
    List<Widget> rowList = [];

    // adding merit number option for HSC board
    if (board == "HSC") {
      rowList.add(addingMeritNumberOptionForHSCBoard(blurRadius));
    }

    // adding merit number option for NEET board
    else {
      rowList.add(addingMeritNumberOptionForNEETBoard(blurRadius));
    }

    // adding category option
    rowList.add(addingCategoryOption(blurRadius));

    // Adding college type option
    rowList.add(addingCollegeTypeOption(blurRadius));

    // adding first row in list
    list.add(Row(children: rowList));

    // adding all clear row for courses
    list.add(addingAllClearRowForCourses());

    // adding lists of courses with checkBox
    list.add(addingListsOfCoursesWithCheckBox());

    // adding row for Show Reset Save for buttons
    list.add(addingRowForShowResetSaveForButtons());

    // returning the final list
    return list;
  }

  Widget addingMeritNumberOptionForHSCBoard(double blurRadius) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: utilities.screenWidth * 0.36,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius)],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            color: utilities.lightGreenColor,
            child: Text("Merit No."),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.all(5),
            child: TextFormField(
              controller: meritController,
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }

  Widget addingMeritNumberOptionForNEETBoard(double blurRadius) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius)],
        color: Colors.white,
      ),
      width: utilities.screenWidth * 0.36,
      child: Column(
        children: [
          Container(
            color: utilities.lightGreenColor,
            height: 30,
            //Dropdown for medical merit,neet,air
            child: DropdownButton2(
              menuItemStyleData:
                  MenuItemStyleData(height: 25, padding: EdgeInsets.all(5)),
              isExpanded: true,
              underline: Container(),
              items: meritDropdownList
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: CustomText(
                            size: 12,
                            item,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValueForMeritType,
              onChanged: (value) {
                setState(() {
                  selectedValueForMeritType = value as String;
                });
              },
            ),
          ),
          Container(
            color: Colors.white,
            height: 40,
            padding: EdgeInsets.all(5),
            child: TextFormField(
              decoration: InputDecoration(errorStyle: TextStyle()),
              controller: meritController,
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }

  Widget addingCategoryOption(double blurRadius) {
    return Container(
      margin: EdgeInsets.only(
        left: utilities.screenWidth * 0.0172,
        right: utilities.screenWidth * 0.0172,
        bottom: 10,
      ),
      width: utilities.screenWidth * 0.29,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius)],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            color: utilities.lightGreenColor,
            child: CustomText(
              "Category",
              size: 12,
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.all(5),
            child: DropdownButton2(
              isExpanded: true,
              underline: Container(),
              items: categoryList
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValueForCategory,
              onChanged: (value) {
                setState(() {
                  print(value);
                  selectedValueForCategory = value.toString();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget addingCollegeTypeOption(double blurRadius) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: utilities.screenWidth * 0.29,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius)],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            color: utilities.lightGreenColor,
            child: CustomText(
              "College Type",
              size: 12,
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.all(5),
            child: DropdownButton2(
              isExpanded: true,
              underline: Container(),
              items: collegeTypes
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValueForCollegeType,
              onChanged: (value) {
                setState(() {
                  selectedValueForCollegeType = value as String;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget addingAllClearRowForCourses() {
    return Container(
      height: 30,
      color: utilities.lightGreenColor,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text("Courses"),
          Container(
            width: 50,
            child: Radio(
              activeColor: utilities.greenColor,
              value: 1,
              groupValue: radioButton,
              onChanged: (value) {
                courses.forEach((key, value) {
                  courses[key] = true;
                });
                setState(() {
                  radioButton = value as int;
                  print(courses);
                });
              },
            ),
          ),
          Text('ALl'),
          Container(
            width: 50,
            child: Radio(
              value: 2,
              activeColor: utilities.greenColor,
              groupValue: radioButton,
              onChanged: (value) {
                setState(() {
                  radioButton = value as int;
                  courses.forEach((key, value) {
                    courses[key] = false;
                  });
                  print(courses);
                });
              },
            ),
          ),
          Text("Clear"),
        ],
      ),
    );
  }

  Widget addingListsOfCoursesWithCheckBox() {
    return Container(
      // margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Column(
        children: courses.keys.map(
          (String key) {
            return InkWell(
              onTap: () {
                radioButton = 3;
                setState(() {
                  courses[key] = !courses[key]!;
                  print(courses.toString());
                });
              },
              child: Card(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: utilities.greenColor,
                        checkColor: Colors.white,
                        value: courses[key],
                        onChanged: (bool? value) {
                          radioButton = 3;
                          setState(() {
                            // print(key);
                            // print(value);

                            courses[key] = value!;
                          });
                          print("aaayaa    :::   " + courses.toString());
                        },
                      ),
                      Expanded(
                        child: Text(key),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget addingRowForShowResetSaveForButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              if (meritController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      width: utilities.screenWidth * 0.9,
                      height: utilities.screenHeight * 0.14,
                      content: Column(children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: BoldText(
                            text: "Message",
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 50),
                          alignment: Alignment.topLeft,
                          child: CustomText((widget.board == "HSC")
                              ? ("Enter the Merit No.")
                              : ("Enter the ${selectedValueForMeritType}")),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CustomText(
                              "OK",
                              color: utilities.greenColor,
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                );
              } else {
                print("Hii");
                String branches = "";
                courses.forEach(
                  (key, value) {
                    if (value == true) {
                      branches += "'${key}', ";
                    }
                  },
                );
                branches = branches.substring(0, branches.length - 2);
                int category;
                if (selectedValueForCategory == "OPEN") {
                  category = 1;
                } else if (selectedValueForCategory == "EWS") {
                  category = 2;
                } else if (selectedValueForCategory == "SEBC") {
                  category = 3;
                } else if (selectedValueForCategory == "SC") {
                  category = 4;
                } else {
                  category = 5;
                }
                int collegeType = 0;
                if (selectedValueForCollegeType == "All") {
                  collegeType = 0;
                } else if (selectedValueForCollegeType == "Gov.") {
                  collegeType = 1;
                } else {
                  collegeType = 2;
                }
                print(meritController.text);
                print(branches);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollegesPage(
                        meritNo: int.parse(meritController.text),
                        board: widget.board!,
                        branches: branches,
                        category: category,
                        collegeType: collegeType,
                        quota: (widget.board == "HSC")
                            ? 1
                            : (selectedValueForMeritType == "Merit No."
                                ? 1
                                : (selectedValueForMeritType == "NEET Mark"
                                    ? 2
                                    : 3))),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: utilities.greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              child: CustomText("Show", color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => CutOffPage(board: widget.board),
                ),
              );
              print("You are in Reset");
            },
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: utilities.greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              child: CustomText(
                "Reset",
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              print("You are in save");
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    width: utilities.screenWidth * 0.9,
                    height: utilities.screenHeight * 0.14,
                    content: Column(children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: BoldText(
                          text: "Message",
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          "Your Favourite is Saved",
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            "OK",
                            color: utilities.greenColor,
                          ),
                        ),
                      )
                    ]),
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: utilities.greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              child: CustomText(
                "Save",
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
