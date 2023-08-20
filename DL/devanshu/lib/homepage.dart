import 'dart:ui';

import 'package:devanshu/Medical/00_medical_page.dart';
import 'package:devanshu/Paramedical/00_paramedical_page.dart';
import 'package:devanshu/database/my_database.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomUtilities utilities = CustomUtilities();
  bool disclaimerBottomSheetController = true;

  @override
  void initState() {
    super.initState();
    MyDatabase().copyPasteAssetFileToRoot().then((value) {
      print("Database Connected Succesfully");
      MyDatabase().getDisclaimer();
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return getDisclaimerBottomSheet();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      // bottomSheet: getDisclaimerBottomSheet(),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Medical-Paramedical Admission"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: utilities.screenHeight * 0.4,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: ListView(
                children: [
                  InkWell(
                    child: CustomListTile(
                      image:
                          Image.asset("assets/images/homepage/ic_medical.png"),
                      height: 70.0,
                      title: "Medical",
                      subtitle1: "MBBS, BDS, BAMS, BHMS",
                      subtitle2: "Gujarati Data",
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalPage(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: CustomListTile(
                      image: Image.asset(
                          "assets/images/homepage/ic_paramedical.png"),
                      height: 85.0,
                      title: "Paramedical",
                      subtitle1: "BPT, B.Sc, Nursing, BOP, BO, BNYS, BOT",
                      subtitle2: "Gujarati Data",
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ParamedicalPage()));
                    },
                  ),
                  InkWell(
                    onTap: () {
                      dynamic url = Uri.parse(
                          "https://t.me/Gujarat_Medical_Paramedical_2023");
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.telegram,
                              color: Colors.blue,
                              size: utilities.screenHeight * 0.035,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              "મેડિકલ પેરામેડિકલ ના લેટેસ્ટ અપડેટ્સ મેળવવા માટે અમારી ટેલિગ્રામ ચેનલ જોઈન કરવા માટે ક્લીક કરો",
                              color: Colors.blue,
                              size: 14,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          BoldText(text: "If you have any query call on "),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                          ),
                          InkWell(
                            child: CustomText(
                              "7096979922",
                              color: Colors.blue,
                              weight: FontWeight.bold,
                            ),
                            onTap: () async {
                              launchUrl(
                                Uri.parse("tel:+917096979922"),
                              );
                            },
                          )
                        ],
                      ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: MyDatabase().getDataFromAnyTable("MST_AppTitle"),
      ),
    );
  }

  dynamic getDisclaimerBottomSheet() {
    if (disclaimerBottomSheetController) {
      return Container(
        height: utilities.screenHeight * 0.35,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Center(
                        child: Text(
                          "Disclaimer",
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: utilities.screenHeight * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      color: Colors.grey,
                      padding: EdgeInsets.only(top: 1),
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          disclaimerBottomSheetController = false;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: FutureBuilder<dynamic>(
                future: MyDatabase().getDisclaimer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 15.0),
                      child: Html(
                        onAnchorTap: (url, context, attributes, element) {
                          dynamic uri = Uri.parse("https:${url}");
                          launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        style: {
                          'body': Style(
                            textAlign: TextAlign.justify,
                            fontSize: FontSize(utilities.screenHeight * 0.017),
                          ),
                          'a': Style(color: Colors.blueAccent)
                        },
                        data: snapshot.data[0]["DisclaimerText"].toString(),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                      text: "Close",
                      size: 20.0,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  disclaimerBottomSheetController = false;
                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
      );
    }
    return;
  }

  Widget CustomListTile({image, height, title, subtitle1, subtitle2}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: title, size: 20.0),
                Text(subtitle1),
                Text(subtitle2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
