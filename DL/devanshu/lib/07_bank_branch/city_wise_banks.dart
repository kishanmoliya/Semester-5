import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class CityWiseBanks extends StatefulWidget {
  const CityWiseBanks({Key? key, required this.city, required this.board})
      : super(key: key);
  final String board;
  final String city;

  @override
  State<CityWiseBanks> createState() => _CityWiseBanksState();
}

class _CityWiseBanksState extends State<CityWiseBanks> {
  CustomUtilities utilities = CustomUtilities();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("HDFC Bank Branches (${snapshot.data.length})"),
            ),
            body: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: (index % 2 == 0)
                        ? Colors.white
                        : utilities.backgroundGreyColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(snapshot.data[index]["BranchName"]),
                      CustomText(
                        snapshot.data[index]["Address"],
                        size: utilities.screenHeight * 0.013,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: MyDatabase().getCityWiseBanks(widget.city, widget.board),
    );
  }
}
