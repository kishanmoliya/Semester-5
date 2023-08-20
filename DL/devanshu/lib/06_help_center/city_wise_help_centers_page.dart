import 'package:devanshu/college_details_page.dart';
import 'package:devanshu/database/my_database.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CityWiseHelpCentersPage extends StatefulWidget {
  CityWiseHelpCentersPage({Key? key, required this.city, required this.board})
      : super(key: key);
  final city;
  final board;

  @override
  State<CityWiseHelpCentersPage> createState() =>
      _CityWiseHelpCentersPageState();
}

class _CityWiseHelpCentersPageState extends State<CityWiseHelpCentersPage> {
  CustomUtilities utilities = CustomUtilities();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Help Center in ${widget.city} (${snapshot.data.length})"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print(index);
                    if (data[index]["CollegeID"] is int) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollegeDetailsPage(
                              collegeID: data[index]["CollegeID"]),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('No details available'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: utilities.screenWidth * 0.85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                text: data[index]["HelpCenterName"]
                                    .toString()
                                    .replaceAll("\n", ""),
                                size: utilities.screenWidth * 0.035,
                              ),
                              CustomText(
                                data[index]["Address"],
                                size: utilities.screenWidth * 0.028,
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
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    // trailing: Text(),
                  ),
                );
              },
              itemCount: snapshot.data.length,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("cjdsbv"),
            ),
          );
        }
      },
      future: MyDatabase().getCityWiseHelpCenters(city: widget.city, board: widget.board),
    );
  }
}
