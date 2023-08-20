import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'medical60.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "medical60.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
          await rootBundle.load(join('assets/database', 'medical60.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  // data for disclaimer for bottomSheet
  Future<dynamic> getDisclaimer() async {
    Database db = await initDatabase();
    dynamic data =
        await db.rawQuery("Select DisclaimerText from MST_Disclaimer");
    return data;
  }

  // data from any table
  Future<dynamic> getDataFromAnyTable(tableName) async {
    Database db = await initDatabase();
    dynamic data = await db.rawQuery("Select * from ${tableName}");
    return data;
  }

  // data by any query
  Future<dynamic> anyQuery(query) async {
    Database db = await initDatabase();
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for 02_colleges_page.dart
  Future<dynamic> getColleges(
      {required String board, required String text}) async {
    String query = "select INS_College.CollegeShortName," +
        "INS_College.CollegeCode," +
        "INS_Branch.DegreeName," +
        "INS_College.CollegeID as _id, " +
        "INS_College.CollegeShortName||' ('||INS_Branch.BranchShortName||')' as College, " +
        "INS_College.Fees, " +
        "'Seats: '||INS_College.Intake as Seats," +
        "'Fees: '||case when INS_College.Fees ISNULL OR INS_College.Fees='' then '-' else '\u20B9'||Fees end as Intake," +
        "case when INS_College.FeesMQ ISNULL OR INS_College.FeesMQ='' then '' else 'MQ: \u20B9'||FeesMQ end as FeesMQ," +
        " MST_CollegeType.CollegeTypeName, " +
        "INS_College.CollegeTypeID " +
        "from INS_College,INS_Branch,MST_CollegeType " +
        "where INS_College.BranchID=INS_Branch.BranchID and " +
        "INS_College.CollegeTypeID=MST_CollegeType.CollegeTypeID and " +
        "INS_College.Intake>0 and " +
        "INS_Branch.Board = '" +
        board +
        "'and" +
        "(INS_College.CollegeShortName like '%${text}%'" +
        " or INS_College.CollegeCode like '%${text}%'" +
        " or INS_College.CollegeName like '%${text}%'" +
        "or INS_Branch.DegreeName like '%${text}%')"
            " order by INS_Branch.BranchID,MST_CollegeType.CollegeTypeID,INS_College.CollegeShortName";
    Database db = await initDatabase();
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for 03_courses_page.dart
  Future<dynamic> getCourses(
      {required String board, required String text}) async {
    Database db = await initDatabase();
    String query =
        "Select *,count(*) from INS_Branch inner join INS_College on INS_Branch.BranchID=INS_College.BranchID where Board='$board' and BranchName Like '%$text%' group by INS_College.BranchID order by Sequence";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data colleges classification by courses
  Future<dynamic> getCollegesClassificationByCourses(
      {required int branchID, required String text}) async {
    Database db = await initDatabase();
    dynamic data = await db.rawQuery(
        "Select * from INS_College where BranchID = $branchID and (CollegeName like '%$text%' or CollegeShortName like '%$text%') order by CollegeShortName");
    return data;
  }

  // data for 05_key_dates.dart
  Future<dynamic> getKeyDates({required board}) async {
    Database db = await initDatabase();
    dynamic data;
    if (board == "HSC") {
      data =
          await db.rawQuery("Select HTMLValue from MST_HTML where HTMLID=34");
    } else {
      data =
          await db.rawQuery("Select HTMLValue from MST_HTML where HTMLID=28");
    }
    return data;
  }

  // data for 06_help_center_page.dart
  Future<dynamic> getHelpCenters(
      {required String text, required String board}) async {
    Database db = await initDatabase();
    String query =
        "select *,count(*) as count from HelpCenter where city like '%$text%' and Board='$board' group by city order by city";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for college_details_page.dart
  Future<dynamic> getCollegeDetails({required int collegeId}) async {
    Database db = await initDatabase();
    String query =
        "select INS_College.CollegeID,INS_College.CollegeName,INS_College.BranchID,INS_College.CollegeShortName,INS_College.Address,INS_College.Phone,INS_College.Mobile,INS_College.Website,INS_College.Email,INS_College.Fees,INS_College.CollegeCode,INS_College.Intake,FeesMQ,FeesNRI,INS_College.Intake_AIQ,INS_College.Intake_MQ,INS_College.Intake_NRI,INS_College.Intake_EWS,INS_College.Intake_SC,INS_College.Intake_ST,INS_College.Intake_SEBC,INS_College.Intake_Open,MST_CollegeType.CollegeTypeName,INS_Branch.BranchShortName,MST_University.UniversityName from INS_College INNER JOIN MST_CollegeType on INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID LEFT OUTER JOIN INS_Branch ON INS_College.BranchID = INS_Branch.BranchID LEFT OUTER JOIN MST_University on INS_College.UniversityID = MST_University.UniversityID Where CollegeID =$collegeId ORDER BY INS_College.CollegeShortName";

    // this is same query as above

    // query = "select " +
    //     "INS_College.CollegeID," +
    //     "INS_College.CollegeName," +
    //     "INS_College.BranchID," +
    //     "INS_College.CollegeShortName," +
    //     "INS_College.Address," +
    //     "INS_College.Phone," +
    //     "INS_College.Mobile," +
    //     "INS_College.Website," +
    //     "INS_College.Email," +
    //     "INS_College.Fees," +
    //     "INS_College.CollegeCode," +
    //     "INS_College.Intake," +
    //     "FeesMQ," +
    //     "FeesNRI," +
    //     "INS_College.Intake_AIQ," +
    //     "INS_College.Intake_MQ," +
    //     "INS_College.Intake_NRI," +
    //     "INS_College.Intake_EWS," +
    //     "INS_College.Intake_SC," +
    //     "INS_College.Intake_ST," +
    //     "INS_College.Intake_SEBC," +
    //     "INS_College.Intake_Open," +
    //     "MST_CollegeType.CollegeTypeName," +
    //     "INS_Branch.BranchShortName," +
    //     "MST_University.UniversityName" +
    //     " from " +
    //     "INS_College" +
    //     " INNER JOIN MST_CollegeType on INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID" +
    //     " LEFT OUTER JOIN INS_Branch ON INS_College.BranchID = INS_Branch.BranchID" +
    //     " LEFT OUTER JOIN MST_University on INS_College.UniversityID = MST_University.UniversityID" +
    //     " Where " +
    //     "CollegeID =" +
    //     "$collegeId" +
    //     " ORDER BY INS_College.CollegeShortName";

    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for city_wise_help_centers_page.dart
  Future<dynamic> getCityWiseHelpCenters(
      {required String city, required String board}) async {
    Database db = await initDatabase();
    String query =
        "select * from HelpCenter where city= '$city' and Board='$board' order by city";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for 07_bank_branch.dart
  Future<dynamic> getCityForBank(String text, String board) async {
    Database db = await initDatabase();
    String query =
        "Select City,count(*) from BankBranch where city like '%$text%' and board = '$board' group by city order by city";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for city_wise_banks.dart
  Future<dynamic> getCityWiseBanks(String city, String board) async {
    Database db = await initDatabase();
    String query =
        "select * from BankBranch where board = '$board' and city = '$city'";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for 08_important_websites.dart
  Future<dynamic> getImportantWebsites({required String tableName}) async {
    Database db = await initDatabase();
    String query = "Select * from $tableName";
    dynamic data = await db.rawQuery(query);
    return data;
  }

  // data for 09_scholarship_page.dart
  Future<dynamic> getScholarship({required board}) async {
    Database db = await initDatabase();
    dynamic data;
    if (board == "HSC") {
      data =
          await db.rawQuery("Select HTMLValue from MST_HTML where HTMLID=30");
    } else {
      data =
          await db.rawQuery("Select HTMLValue from MST_HTML where HTMLID=29");
    }
    return data;
  }

  // data for 11_bond_of_mbbs.dart
  Future<dynamic> getBondOfMBBS() async {
    Database db = await initDatabase();
    dynamic data = await db
        .rawQuery("Select HTMLValue from MST_HTML where HTMLName = 'MBBSBond'");
    return data;
  }

  // data for 12_mark_vs_rank.dart
  Future<dynamic> getMarkVsRank() async {
    Database db = await initDatabase();
    dynamic data = await db
        .rawQuery("Select HTMLValue from MST_HTML where HTMLName='markvsrank'");
    return data;
  }
}
