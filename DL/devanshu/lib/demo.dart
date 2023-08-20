// import 'package:architecture/Database/architecture_database.dart';
// import 'package:architecture/Pages/01_Cut-Off/architecture_colleges_page.dart';
// import 'package:architecture/Pages/01_Cut-Off/city_and_colleges_list_page.dart';
// import 'package:architecture/Pages/Utilities/app_bar.dart';
// import 'package:architecture/Pages/Utilities/utilities_variables.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
//
// class SearchCollegePage extends StatefulWidget {
//   const SearchCollegePage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchCollegePage> createState() => _SearchCollegePageState();
// }
//
// class _SearchCollegePageState extends State<SearchCollegePage> {
//   CustomUtilitiesAndVariables variable = CustomUtilitiesAndVariables();
//   Map<String, String> categories = {
//     'OPEN': "OpenClosingRank",
//     'SEBC': "SebcClosingRank",
//     'SC': "SCClosingRank",
//     'ST': "STClosingRank",
//   };
//   Map<String, String> collegeTypes = {
//     'ALL': "ALL",
//     'GIA': "GIA",
//     'SFI': "SFI",
//   };
//   String categoryValue = "OPEN", collegeTypeValue = "ALL";
//   String boardController = "GB";
//   var _rankController = TextEditingController(text: '1');
//   final _formKey = GlobalKey<FormState>();
//   List<String> cityList = [],
//       collegeList = [],
//       subCityList = [],
//       subCollegeList = [];
//   int cityCount = 0, clgCount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     ArchitectureDatabase()
//         .getDataFromAnyTable(
//         query:
//         'SELECT CollegeShortName FROM INS_College ORDER BY CollegeShortName',
//         columnName: 'CollegeShortName')
//         .then((value) {
//       collegeList.addAll(value);
//     });
//     ArchitectureDatabase()
//         .getDataFromAnyTable(
//         query: 'SELECT CityName FROM LOC_City ORDER BY CityName',
//         columnName: 'CityName')
//         .then((value) {
//       cityList.addAll(value);
//     });
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     variable.screenSize(context);
//     return Scaffold(
//       appBar: const CustomAppBar(title: "Search Architecture Colleges"),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(variable.space * 0.5),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   getCustomVerticalCard(
//                     label: "Merit No.",
//                     widget: getCustomTextFormField(),
//                   ),
//                   getCustomVerticalCard(
//                     label: "Category",
//                     widget: dropDownButton(
//                       items: categories,
//                       selectedValue: categoryValue,
//                     ),
//                   ),
//                   getCustomVerticalCard(
//                     label: "College Type",
//                     widget: dropDownButton(
//                       items: collegeTypes,
//                       selectedValue: collegeTypeValue,
//                     ),
//                   ),
//                 ],
//               ),
//               getCustomHorizontalCard(
//                 label: "Board",
//                 widget: getCustomRadioButton(),
//               ),
//               getCustomHorizontalCard(
//                 label: "City",
//                 widget: getSelectedCityORColleges(
//                   nonSelectLabel: "All City",
//                   selectLabel: "Cities ($cityCount)",
//                   count: cityCount,
//                   navigateScreen:
//                   const CityAndCollegesListPage(title: "Select City"),
//                   itemsList: cityList,
//                 ),
//               ),
//               getCustomHorizontalCard(
//                 label: "College",
//                 widget: getSelectedCityORColleges(
//                   nonSelectLabel: "All College",
//                   selectLabel: "Colleges ($clgCount)",
//                   count: clgCount,
//                   navigateScreen:
//                   const CityAndCollegesListPage(title: "College"),
//                   itemsList: collegeList,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   getCustomButtons(buttonName: "Show"),
//                   getCustomButtons(buttonName: "Reset"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   //region CUSTOM VERTICAL CARD...
//   Widget getCustomVerticalCard({label, widget}) {
//     return Expanded(
//       child: SizedBox(
//         height: variable.screenHeight * 0.125,
//         child: Card(
//           elevation: variable.elevation,
//           child: Column(
//             children: [
//               Container(
//                 height: variable.screenHeight * 0.06,
//                 alignment: Alignment.center,
//                 color: variable.lightThemeColor,
//                 child: Text(
//                   label,
//                   style: TextStyle(fontWeight: variable.boldFont, fontSize: 16),
//                 ),
//               ),
//               SizedBox(
//                 height: variable.screenHeight * 0.05,
//                 child: widget,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   //endregion
//
//   //region CUSTOM HORIZONTAL CARD...
//   Widget getCustomHorizontalCard({label, widget}) {
//     return Card(
//       elevation: variable.elevation,
//       child: Row(
//         children: [
//           Container(
//             height: variable.screenHeight * 0.06,
//             width: variable.screenWidth * 0.3,
//             alignment: Alignment.center,
//             color: variable.lightThemeColor,
//             child: Text(
//               label,
//               style: TextStyle(fontWeight: variable.boldFont, fontSize: 17),
//             ),
//           ),
//           Container(
//             child: widget,
//           ),
//         ],
//       ),
//     );
//   }
//
//   //endregion
//
//   //region CUSTOM TEXT FORM FIELD...
//   Widget getCustomTextFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       controller: _rankController,
//       decoration: InputDecoration(
//           hintText: "Rank.",
//           contentPadding: EdgeInsets.fromLTRB(variable.space, 0, variable.space, variable.space * 2),
//           border: InputBorder.none
//       ),
//     );
//   }
//
//   //endregion
//
//   //region CUSTOM DROP DOWN BUTTON...
//   Widget dropDownButton({required Map<String, String> items, selectedValue}) {
//     return DropdownButtonHideUnderline(
//       //region DROPDOWN BUTTON...
//       child: DropdownButton2(
//         buttonPadding: EdgeInsets.symmetric(horizontal: variable.space * 1.7),
//         //region DROPDOWN MENU ITEMS...
//         items: items.keys
//             .map(
//               (item) => DropdownMenuItem<String>(
//             value: item,
//             child: Text(
//               item,
//             ),
//           ),
//         )
//             .toList(),
//         //endregion
//         value: selectedValue,
//         onChanged: (value) {
//           setState(
//                 () {
//               if (items == categories) {
//                 categoryValue = value.toString();
//               } else {
//                 collegeTypeValue = value.toString();
//               }
//             },
//           );
//         },
//         buttonWidth: variable.screenWidth * 0.5,
//       ),
//       //endregion
//     );
//   }
//
//   //endregion
//
//   //region CUSTOM RADIO BUTTON...
//   Widget getCustomRadioButton() {
//     return Row(
//       children: [
//         Radio(
//           value: "GB",
//           groupValue: boardController,
//           onChanged: (value) {
//             setState(() {
//               boardController = value!;
//             });
//           },
//           visualDensity: const VisualDensity(
//             vertical: VisualDensity.minimumDensity,
//           ),
//         ),
//         Text(
//           "GB",
//           style: TextStyle(fontWeight: variable.boldFont),
//         ),
//         Radio(
//           value: "CBSE",
//           groupValue: boardController,
//           onChanged: (value) {
//             setState(() {
//               boardController = value!;
//             });
//           },
//           visualDensity: const VisualDensity(
//             vertical: VisualDensity.minimumDensity,
//           ),
//         ),
//         Text(
//           "CBSE",
//           style: TextStyle(fontWeight: variable.boldFont),
//         ),
//       ],
//     );
//   }
//
// //endregion
//
//   //region CUSTOM SELECTION FIELD...
//   Widget getSelectedCityORColleges(
//       {nonSelectLabel, selectLabel, navigateScreen, count, itemsList}) {
//     return Expanded(
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context)
//               .push(
//             MaterialPageRoute(
//               builder: (context) => navigateScreen,
//             ),
//           )
//               .then((value) {
//             setState(() {
//               if (nonSelectLabel == 'All City') {
//                 subCityList.clear();
//                 subCityList.addAll(value);
//                 cityCount = subCityList.length;
//               } else {
//                 subCollegeList.clear();
//                 subCollegeList.addAll(value);
//                 clgCount = subCollegeList.length;
//               }
//             });
//           });
//         },
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: variable.space * 3),
//                 child: Text(
//                   (count == 0 || count == itemsList.length)
//                       ? nonSelectLabel
//                       : selectLabel,
//                   style: const TextStyle(fontSize: 17),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(variable.space * 2),
//               child: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 17,
//                 color: Colors.grey.shade500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   //endregion
//
//   //region CUSTOM BUTTONS...
//   Widget getCustomButtons({buttonName}) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.all(variable.space),
//         child: ElevatedButton(
//           onPressed: () {
//             if (buttonName == "Show") {
//               if (_rankController.text.isEmpty ||
//                   int.parse(_rankController.text) > 999999) {
//                 showAlertDialogBox();
//               } else {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return ArchitectureCollegesPage(
//                         rank: int.parse(_rankController.text.toString()),
//                         clgType: collegeTypes[collegeTypeValue.toString()].toString(),
//                         category: categories[categoryValue.toString()].toString(),
//                         board: boardController.toString(),
//                         cityList: subCityList.isEmpty ? cityList : subCityList,
//                         collegeList: subCollegeList.isEmpty ? collegeList : subCollegeList,
//                       );
//                     },
//                   ),
//                 );
//                 FocusManager.instance.primaryFocus?.unfocus();
//               }
//             }else{
//               setState(() {
//                 categoryValue = "OPEN";
//                 collegeTypeValue = "ALL";
//                 _rankController = TextEditingController(text: "1");
//                 boardController = "GB";
//                 subCityList.clear();
//                 subCollegeList.clear();
//                 cityCount = 0;
//                 clgCount = 0;
//               });
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: variable.themeColor,
//             elevation: variable.elevation,
//             padding: EdgeInsets.all(variable.space * 2),
//           ),
//           child: Text(
//             buttonName,
//             style: TextStyle(fontWeight: variable.boldFont),
//           ),
//         ),
//       ),
//     );
//   }
//   //endregion
//
//   //region CUSTOM ALERT DIALOG BOX...
//   Future<void> showAlertDialogBox() async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: const Text("Please, Enter Merit no. must be between 1 to 999999.",
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: variable.themeColor,
//                 elevation: variable.elevation,
//               ),
//               child: Text(
//                 "OK",
//                 style: TextStyle(fontWeight: variable.boldFont),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// //endregion
// }
//
