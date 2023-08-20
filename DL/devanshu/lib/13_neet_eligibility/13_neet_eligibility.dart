import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeetEligibility extends StatefulWidget {
  const NeetEligibility({Key? key}) : super(key: key);

  @override
  State<NeetEligibility> createState() => _NeetEligibilityState();
}

List<String> list = <String>['General', 'GenPH', 'SEBC', 'SC', 'ST'];

class _NeetEligibilityState extends State<NeetEligibility> {
  CustomUtilities utilities = CustomUtilities();
  String selectedValue = list[0];
  TextEditingController chemistryTheoryController = TextEditingController();
  TextEditingController chemistryPracticalController = TextEditingController();
  TextEditingController physicsTheoryController = TextEditingController();
  TextEditingController physicsPracticalController = TextEditingController();
  TextEditingController biologyTheoryController = TextEditingController();
  TextEditingController biologyPracticalController = TextEditingController();
  double percentage = 0.00;
  final _formKey = GlobalKey<FormState>();

  bool visible = false;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              "NEET (UG) Eligibility Check",
              size: 20,
            ),
            CustomText(
              "For Gujarat Board Students only",
              size: 16,
              color: utilities.lightGreenColor,
              weight: FontWeight.w400,
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        color: utilities.backgroundLightGreyColor,
        child: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 1)
                    ]),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          color: utilities.lightGreenColor,
                          child: Text("Category"),
                          alignment: Alignment.center,
                        ),
                        Container(
                          height: 45,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(10),
                          child: DropdownButton2(
                            underline: Container(),
                            isExpanded: true,
                            items: list
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                  ),
                  width: utilities.screenWidth,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerLeft,
                              color: utilities.greenColor,
                              child: CustomText(
                                "Subject",
                                color: Colors.white,
                              ),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerRight,
                              color: utilities.greenColor,
                              child: CustomText(
                                "Theory",
                                color: Colors.white,
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerRight,
                              color: utilities.greenColor,
                              child: CustomText(
                                "Practical",
                                color: Colors.white,
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerLeft,
                              child: CustomText("Chemistry"),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(
                                5,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                  ),
                                ),
                                child: TextFormField(
                                  // style: TextStyle(fontSize: 16.0),
                                  controller: chemistryTheoryController,
                                  textAlign: TextAlign.right,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  validator: (value) {
                                    int marks = int.parse(value.toString());
                                    if (showTextFormFieldSnackBar(marks, 100)) {
                                      return "";
                                      setState(() {
                                        hasError = true;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "100",
                                      suffixIcon: hasError
                                          ? Icon(
                                              Icons.info,
                                              size: 50,
                                            )
                                          : null),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: TextFormField(
                                  controller: chemistryPracticalController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "50",
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    int marks = int.parse(value.toString());
                                    showTextFormFieldSnackBar(marks, 50);
                                  },
                                ),
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerLeft,
                              child: CustomText("Physics"),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: Container(
                                  height: 60,
                                  child: TextFormField(
                                    controller: physicsTheoryController,
                                    textAlign: TextAlign.right,
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "100",
                                      // helperText: ' ',
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      int marks = int.parse(value.toString());
                                      showTextFormFieldSnackBar(marks, 100);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: TextFormField(
                                    controller: physicsPracticalController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "50",
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      int marks = int.parse(value.toString());
                                      showTextFormFieldSnackBar(marks, 50);
                                    }),
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.centerLeft,
                              child: CustomText("Biology"),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: TextFormField(
                                  controller: biologyTheoryController,
                                  textAlign: TextAlign.right,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "100",
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    int marks = int.parse(value.toString());
                                    showTextFormFieldSnackBar(marks, 100);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: TextFormField(
                                  controller: biologyPracticalController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "50",
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    int marks = int.parse(value.toString());
                                    showTextFormFieldSnackBar(marks, 50);
                                  },
                                ),
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            print(physicsTheoryController.text);
                            _formKey.currentState!.validate();
                            int total = int.parse(physicsTheoryController.text);
                            total += int.parse(physicsPracticalController.text);
                            total += int.parse(chemistryTheoryController.text);
                            total +=
                                int.parse(chemistryPracticalController.text);
                            total += int.parse(biologyTheoryController.text);
                            total += int.parse(biologyPracticalController.text);
                            setState(() {
                              print("HOOOOOO");
                              percentage = (total / 450) * 100;
                              visible = true;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: utilities.greenColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                            child: CustomText(
                              "Check Eligibility",
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                      Visibility(

                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(5),
                          child: Column(children: getEligibilityList()),
                        ),
                        visible: visible,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getEligibilityList() {
    List<Widget> list = [
      CustomText('${percentage.toStringAsFixed(2)} %',
          size: 25, weight: FontWeight.bold),
    ];
    double eligibleTextSize = 20;
    if (selectedValue == "General" && percentage >= 50) {
      list.add(BoldText(
        text: "You are eligible for NEET Exam",
        color: utilities.greenColor,
        size: eligibleTextSize,
      ));
    } else if (selectedValue == "GenPH" && percentage >= 45) {
      list.add(BoldText(
        text: "You are eligible for NEET Exam",
        color: utilities.greenColor,
        size: eligibleTextSize,
      ));
    } else if ((selectedValue == "SC" ||
            selectedValue == "ST" ||
            selectedValue == "SEBC") &&
        percentage > 40) {
      list.add(BoldText(
        text: "You are eligible for NEET Exam",
        color: utilities.greenColor,
        size: eligibleTextSize,
      ));
    } else {
      list.add(BoldText(
        text: "You are not eligible for NEET Exam",
        color: Colors.red,
        size: eligibleTextSize,
      ));
    }

    list.add(
      Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: CustomText(
          alignment: TextAlign.center,
          size: 13,
          weight: FontWeight.bold,
          "If you are fail in exam then you are not eligible for NEET(UG) Exam",
          color: Colors.red,
        ),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: utilities.lightGreenColor,
            border: Border.all(color: Colors.grey.shade300)),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: BoldText(text: "NEET(UG) Eligible Criteria"),
      ),
    );
    list.add(Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: utilities.lightGreenColor,
                ),
                alignment: Alignment.center,
                child: Text("General"),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
                alignment: Alignment.center,
                child: Text("50 %"),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: utilities.lightGreenColor,
                ),
                alignment: Alignment.center,
                child: Text("OBC | SC | ST"),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
                alignment: Alignment.center,
                child: Text("40 %"),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: utilities.lightGreenColor,
                ),
                alignment: Alignment.center,
                child: Text("PWD"),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
                alignment: Alignment.center,
                child: Text("45 %"),
              ),
            )
          ],
        ),
      ],
    ));
    list.add(
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            alignment: Alignment.centerLeft,
            child: CustomText(
              "* Marks in PCB Subject (Theory + Practical)",
              color: Colors.red.shade800,
              size: 12,
            ),
          ),
          Container(
              padding: EdgeInsets.all(2),
              alignment: Alignment.centerLeft,
              child: BoldText(
                  size: 12, text: "For more detail contact on : 9879879861"))
        ],
      ),
    );
    return list;
  }

  bool showTextFormFieldSnackBar(marks, outOfMarks) {
    if (marks < 0) {
      final snackBar = SnackBar(
        content: const Text('Enter marks greater than 0'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else if (marks > outOfMarks) {
      final snackBar = SnackBar(
        content: Text('Enter marks less than ${outOfMarks}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    }
    return false;
  }

// bool checkValidation() {
//   if (checkValidation2(100, chemistryTheoryController)) {
//     return false;
//   } else if (checkValidation2(50, chemistryPracticalController)) {
//     return false;
//   } else if (checkValidation2(100, physicsTheoryController)) {
//     return false;
//   } else if (checkValidation2(50, physicsPracticalController)) {
//     return false;
//   } else if (checkValidation2(100, biologyTheoryController)) {
//     return false;
//   } else if (checkValidation2(50, biologyPracticalController)) {
//     return false;
//   }
//   return true;
// }
//
// bool checkValidation2(int maxMarks, TextEditingController controller) {
//   if (controller.text.isEmpty) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CustomAlertDialog(
//           width: utilities.screenWidth * 0.9,
//           height: utilities.screenHeight * 0.14,
//           content: Column(children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 15),
//               child: BoldText(
//                 text: "Message",
//               ),
//               alignment: Alignment.centerLeft,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               alignment: Alignment.topLeft,
//               child: CustomText("Enter the chemistry marks"),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: CustomText(
//                   "OK",
//                   color: utilities.greenColor,
//                 ),
//               ),
//             )
//           ]),
//         );
//       },
//     );
//     return false;
//   } else if (int.parse(controller.text) > maxMarks &&
//       int.parse(controller.text) > -1) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CustomAlertDialog(
//           width: utilities.screenWidth * 0.9,
//           height: utilities.screenHeight * 0.14,
//           content: Column(children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 15),
//               child: BoldText(
//                 text: "Message",
//               ),
//               alignment: Alignment.centerLeft,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               alignment: Alignment.topLeft,
//               child: CustomText("Enter marks from 0 to ${maxMarks}"),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: CustomText(
//                   "OK",
//                   color: utilities.greenColor,
//                 ),
//               ),
//             )
//           ]),
//         );
//       },
//     );
//     return false;
//   }
//   return true;
// }
}
