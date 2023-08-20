import 'package:devanshu/07_bank_branch/city_wise_banks.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:devanshu/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:devanshu/database/my_database.dart';

class BankBranch extends StatefulWidget {
  BankBranch({Key? key, required this.board}) : super(key: key);
  final board;

  @override
  State<BankBranch> createState() => _BankBranchState();
}

class _BankBranchState extends State<BankBranch> {
  CustomUtilities utilities = CustomUtilities();
  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int totalBanks = 0;
          for (int i = 0; i < snapshot.data.length; i++) {
            totalBanks += int.parse(snapshot.data[i]["count(*)"].toString());
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("HDFC Bank Branches (${totalBanks})"),
            ),
            body: ListView(children: getListViewChildren(snapshot.data)),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: MyDatabase().getCityForBank(searchBarController.text, widget.board),
    );
  }

  List<Widget> getListViewChildren(data) {
    List<Widget> list = [];
    list.add(
      Container(
        color: Colors.black12,
        padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
        child: TextFormField(
          onTap: () {},
          onChanged: (value) {
            setState(() {});
          },
          controller: searchBarController,
          decoration: InputDecoration(
            hintText: "Search",
            contentPadding: EdgeInsets.only(left: 10, top: 15),
          ),
        ),
      ),
    );
    for (int i = 0; i < data.length; i++) {
      list.add(
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CityWiseBanks(
                    city: data[i]["City"].toString(), board: widget.board),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color:
                  (i % 2 == 0) ? Colors.white : utilities.backgroundLightGreyColor,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  width: utilities.screenWidth * 0.90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        text: '${data[i]["City"]} (${data[i]["count(*)"]})',
                      ),
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
          ),
        ),
      );
    }
    return list;
  }
}
