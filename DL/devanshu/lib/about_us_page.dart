import 'package:devanshu/util/custom_utilities.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  CustomUtilities utilities = CustomUtilities();
  List<dynamic> apiVersions = [];

  @override
  void initState() {
    super.initState();
    // UpdateAppVersion().getVersions().then((value) {
    //   setState(() {
    //     apiVersions = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Scrollbar(
        thickness: 5,
        radius: const Radius.circular(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //region LOGO AND VERSION...
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // const CircleAvatar(
                    //   maxRadius: 50,
                    //   minRadius: 40,
                    //   backgroundImage:
                    //   AssetImage(
                    //       "assets/images/common/logo_medical_admission.png"),
                    // ),
                    Image.asset(
                      "assets/images/common/logo_medical_admission.png",
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Architecture 2023 (version)",
                        style: TextStyle(
                          fontSize: 18,
                          color: utilities.greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //endregion

              //region MEET OUR TEAM...
              getCustomLabelBox(title: 'Meet Our Team'),
              getCustomContainer(
                widget: Column(
                  children: [
                    getCustomInformationContainer(
                      label: 'Developed by',
                      text: 'Devanshu Shah',
                    ),
                    getCustomInformationContainer(
                      label: 'Mentored by',
                      text:
                          'Prof. Mehul Bhundiya, Computer Engineering Department',
                    ),
                    getCustomInformationContainer(
                      label: 'Explored by',
                      text: 'ASWDC, School of Computer Science',
                    ),
                    getCustomInformationContainer(
                      label: 'Eulogized by',
                      text: 'Darshan University, Rajkot, Gujarat - INDIA',
                    ),
                  ],
                ),
              ),
              //endregion

              //region ABOUT ASWDC...
              getCustomLabelBox(title: 'About ASWDC'),
              getCustomContainer(
                widget: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomImageContainer(
                              imgPath: "assets/images/common/DU_Logo.png"),
                          getCustomImageContainer(
                            imgPath: "assets/images/common/logo_aswdc.png",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: getCustomTextContainer(
                        text:
                            """ASWDC is Application, Software and website Development Center @ Darshan University run by Students and Staff of School of Computer Science.""",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: getCustomTextContainer(
                        text:
                            """Sole purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experiences professional environment @ ASWDC under guidance of industry experts & faculty members.""",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              //endregion

              //region CONTACT US...
              getCustomLabelBox(title: 'Contact Us'),
              getCustomContainer(
                widget: Column(
                  children: [
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_email.png',
                      text: 'aswdc@darshan.ac.in',
                      url: 'mailto:aswdc@darshan.ac.in',
                    ),
                    getCustomContactContainer(
                        icon: 'assets/icons/ic_phone.png',
                        text: '+91 - 9727747317',
                        url: 'tel:9727747317'),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_website.png',
                      text: 'www.darshan.ac.in',
                      url: 'https:www.darshan.ac.in',
                    ),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_share.png',
                      text: 'Share app',
                      isShare: true,
                    ),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_android.png',
                      text: 'More Apps',
                      url:
                          'https://play.google.com/store/apps/developer?id=Admission+Mobile+Apps&hl=en',
                    ),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_star.png',
                      text: 'Rate Us',
                      url:
                          'https://play.google.com/store/apps/details?id=com.architecture',
                    ),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_update.png',
                      text: 'Check for Updates',
                      url:
                          'https://play.google.com/store/apps/details?id=com.architecture',
                    ),
                    getCustomContactContainer(
                      icon: 'assets/icons/ic_update.png',
                      text: 'Check for Database Updates',
                      isDatabaseUpdate: true,
                    ),
                  ],
                ),
              ),
              //endregion

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "\u00a9 2023 Darshan University",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "All Rights Reversed - ",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                                "http://www.darshan.ac.in/DIET/ASWDC-Mobile-Apps/Privacy-Policy-General"),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: utilities.greenColor,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                      "Made with ♥ in India ",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCustomLabelBox({title}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        color: utilities.greenColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5 * 4),
      padding: EdgeInsets.symmetric(horizontal: 5 * 2, vertical: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getCustomContainer({widget}) {
    return Card(
      elevation: 2.5,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5 * 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5 * 3, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: utilities.greenColor),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: widget,
      ),
    );
  }

  Widget getCustomInformationContainer({label, text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: getCustomTextContainer(
                text: label, color: utilities.greenColor),
          ),
          Expanded(
            child: getCustomTextContainer(
                text: '\t\t:', color: utilities.greenColor),
          ),
          Expanded(
            flex: 5,
            child: getCustomTextContainer(
              text: text,
            ),
          ),
        ],
      ),
    );
  }

  Widget getCustomTextContainer({text, color, textAlign}) {
    return Text(
      text,
      style: TextStyle(
        color: (color == null) ? Colors.blueGrey : utilities.greenColor,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      textAlign: textAlign,
    );
  }

  Widget getCustomImageContainer({imgPath}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5 * 2),
      child: Image.asset(
        imgPath,
        filterQuality: FilterQuality.high,
        scale: 5.5,
      ),
    );
  }

  Widget getCustomContactContainer(
      {icon, text, isDatabaseUpdate = false, url, isShare = false}) {
    return InkWell(
      onTap: () async {
        if (isDatabaseUpdate) {
          //region Dialog - 1
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              // UpdateDatabase().getQueries();
              // Future.delayed(const Duration(seconds: 23), () {
              //   Navigator.of(context).pop(true);
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) => const SplashScreenPage(),
              //   ));
              //   print('database updated...');
              // });
              return AlertDialog(
                backgroundColor: Colors.black,
                title: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Architecture 2023",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                titlePadding: const EdgeInsets.all(0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "It will take 2 to 3 minutes.",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: const Text(
                        "Database Updating....",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          );
          //endregion

          //region Dialog - 2
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              // ArchitectureDatabase().updateAppVersion(
              //     newVersion: int.parse(
              //         apiVersions[0]['AndroidDatabaseVersion'].toString()));
              Future.delayed(
                const Duration(seconds: 22),
                () {
                  Navigator.of(context).pop();
                },
              );
              return AlertDialog(
                content: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text('Database Updating...'),
                  ],
                ),
              );
            },
          );
          //endregion
        } else if (isShare) {
          final box = context.findRenderObject() as RenderBox?;
          String content =
              "Download App of Gujarat Medical Admission - 2023 from Play Store";
          await Share.share(
            "$content : https://play.google.com/store/apps/details?id=com.architecture",
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          );
        } else {
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        }
      },
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5 * 1.5),
            child: Image.asset(
              icon,
              color: utilities.greenColor,
              scale: 5 * 6,
              filterQuality: FilterQuality.high,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5 * 2),
              child: getCustomTextContainer(text: text),
            ),
          ),
        ],
      ),
    );
  }
}
