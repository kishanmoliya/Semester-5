import 'package:devanshu/01_cut_off/01_cut_off_page.dart';
import 'package:devanshu/02_college/02_college_page.dart';
import 'package:devanshu/03_courses/03_courses_page.dart';
import 'package:devanshu/04_news/07_news.dart';
import 'package:devanshu/05_key_dates/06_keydates.dart';
import 'package:devanshu/06_help_center/06_help_center_page.dart';
import 'package:devanshu/07_bank_branch/07_bank_branch.dart';
import 'package:devanshu/08_website/08_important_websites.dart';
import 'package:devanshu/09_scholarship/09_scholarship_page.dart';
import 'package:devanshu/11_bond_of_mbbs/11_bond_of_mbbs.dart';
import 'package:devanshu/12_mark_vs_rank/12_mark_vs_rank.dart';
import 'package:devanshu/about_us_page.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../13_neet_eligibility/temp.dart';
// import 'package:share_plus/share_plus.dart';

class MedicalPage extends StatefulWidget {
  const MedicalPage({Key? key}) : super(key: key);

  @override
  State<MedicalPage> createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  CustomUtilities utilities = CustomUtilities();
  final String shareMessage =
      "ગુજરાત મેડિકલ / પેરા-મેડિકલ એડમિશન 2022 માટેની માહિતી જેમકે " +
          "\n\n »  કોલેજની સંપૂર્ણ માહિતી" +
          "\n »  કોર્ષવાઈઝ  સીટની સંખ્યા" +
          "\n »  એડમિશન-2021 કલોઝિંગ રેન્ક " +
          "\n\nએડમિશન-2022 ને લગતા કોઈપણ પ્રશ્ન પૂછવા માટે ફ્રી મોબાઈલ એપ ડાઉનલોડ કરો." +
          "\n\nAndroid: http://diet.vc/a_aGroupB" +
          "\n\nઅને" +
          "\n\niPhone: http://diet.vc/a_iGroupB";
  List gridViewList = [
    {
      "image": "assets/images/gridview_images/01_cut_off.png",
      "content": "Cut-Off",
      "page": CutOffPage(
        board: "NEET",
      )
    },
    {
      "image": "assets/images/gridview_images/02_college.png",
      "content": "College",
      "page": CollegePage(board: "NEET"),
    },
    {
      "image": "assets/images/gridview_images/03_courses.png",
      "content": "Courses",
      "page": CoursePage(
        board: "NEET",
      ),
    },
    {
      "image": "assets/images/gridview_images/04_news.png",
      "content": "News",
      "page":NewsPage(),
    },
    {
      "image": "assets/images/gridview_images/05_key_dates.png",
      "content": "Key Dates",
      "page": KeyDates(
        board: "NEET",
      )
    },
    {
      "image": "assets/images/gridview_images/06_help_center.png",
      "content": "Help Center",
      "page": HelpCenterPage(
        board: "NEET",
      ),
    },
    {
      "image": "assets/images/gridview_images/07_bank_branch.png",
      "content": "Bank Branch",
      "page": BankBranch(
        board: "NEET",
      ),
    },
    {
      "image": "assets/images/gridview_images/08_website.png",
      "content": "Website",
      "page": ImportantWebsites(),
    },
    {
      "image": "assets/images/gridview_images/09_scholarship.png",
      "content": "Scholarship",
      "page": ScholarshipPage()
    },
    {
      "image": "assets/images/gridview_images/10_ready_reckoner.png",
      "content": "Ready Reckoner 2022",
    },
    {
      "image": "assets/images/gridview_images/11_bond_of_mbbs.png",
      "content": "Bond for MBBS",
      "new": true,
      "page": BondOfMbbsPage()
    },
    {
      "image": "assets/images/gridview_images/12_mark_vs_rank.png",
      "content": "Mark v/s Rank",
      "page": MarkVsRankPage()
    },
    {
      "image": "assets/images/gridview_images/13_neet_ug.png",
      "content": "NEET(UG)\nEligibility",
      "page": NeetEligibility()
    },
  ];

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: utilities.screenWidth * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Medical admission based on Neet...",
                    weight: FontWeight.bold,
                    size: 19,
                  ),
                  Text(
                    "MBBS, BDS, BAMS, BHMS",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: utilities.lightGreenColor),
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await Share.share(shareMessage);
            },
            child: Icon(
              Icons.share,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Container(
                  width: utilities.screenWidth * 0.4,
                  height: 50,
                  child: Text("Developer"),
                  alignment: Alignment.centerLeft,
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Container(
                  width: utilities.screenWidth * 0.4,
                  height: 50,
                  child: Text("Other App"),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AboutUsPage();
                    },
                  ),
                );
              } else if (value == 1) {
                dynamic uri = Uri.parse(
                    "https://play.google.com/store/apps/developer?id=Admission+Mobile+Apps");
                launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(color: utilities.backgroundGreyColor),
        child: GridView.builder(
            itemCount: 13,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.2,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              if (gridViewList[index]["new"] is bool) {
                return InkWell(
                    onTap: () {
                      navigate(gridViewList[index]["content"],
                          gridViewList[index]["page"]);
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 2)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 45,
                                child:
                                    Image.asset(gridViewList[index]["image"]),
                              ),
                              Text(
                                gridViewList[index]["content"],
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(right: 60),
                          child: Image.asset(
                            "assets/images/common/new_icon.png",
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ],
                    ));
              } else {
                return InkWell(
                  onTap: () async {
                    navigate(gridViewList[index]["content"],
                        gridViewList[index]["page"]);
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 2)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 45,
                          child: Image.asset(gridViewList[index]["image"]),
                        ),
                        Text(
                          gridViewList[index]["content"],
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  void navigate(content, page) {
    if (content == "Ready Reckoner 2022") {
      dynamic url = Uri.parse("https:diet.vc/brr");
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }
}
