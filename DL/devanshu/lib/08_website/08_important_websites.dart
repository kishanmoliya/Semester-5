import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devanshu/database/my_database.dart';

class ImportantWebsites extends StatefulWidget {
  ImportantWebsites({Key? key}) : super(key: key);

  @override
  State<ImportantWebsites> createState() => _ImportantWebsitesState();
}

class _ImportantWebsitesState extends State<ImportantWebsites> {
  CustomUtilities utilities = CustomUtilities();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Important Websites"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          dynamic url = Uri.parse(
                              "https:${snapshot.data[index]["WebsiteUrl"]}");
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: utilities.screenWidth * 0.95,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                snapshot.data[index]["WebsiteTitle"],
                                weight: FontWeight.w500,
                              ),
                              Container(
                                height: 3,
                              ),
                              CustomText(
                                snapshot.data[index]["WebsiteUrl"],
                                color: Color.fromRGBO(0, 0, 255, 1),
                                weight: FontWeight.w500,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Colors.black12,
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
        future: MyDatabase().getImportantWebsites(tableName: "MST_Website"),
      ),
    );
  }
}
