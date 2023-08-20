import 'package:devanshu/database/my_database.dart';
import 'package:devanshu/util/IntConstants.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper_CutoffPage extends MyDatabase {
  static final String COLUMN_ID = "_id";
  static final String COLUMN_COLLEGEID = "CollegeID";
  static final String COLUMN_DEGREENAME = "DegreeName";
  static final String COLUMN_COLLEGE_SHORTNAME = "CollegeShortName";
  static final String COLUMN_CLOSINGRANK = "ClosingRank";
  static DatabaseHelper_CutoffPage? instance;

  // static DatabaseHelper_CutoffPage getInstance() {
  //   if (instance == null) {
  //     instance = new DatabaseHelper_CutoffPage();
  //   }
  //   return instance!;
  // }

//   Future<dynamic> select_CutOff(
//       {
//       // required String searchText,
//       required int meritno,
//       required int category,
//       required String collegetype,
//       required int quota,
//       required branches,
//       required String board}) async {
//     String categoryColumnName = "";
//     if (category == 1) {
//       categoryColumnName = "OPENClosing";
//     } else if (category == 2) {
//       categoryColumnName = "EWSClosing";
//     } else if (category == 3) {
//       categoryColumnName = "SEBCClosing";
//     } else if (category == 4) {
//       categoryColumnName = "SCClosing";
//     } else if (category == 5) {
//       categoryColumnName = "STClosing";
//     }
//     String city = "";
//     String collegename = "";
//     print("quota:::${quota}");
//     /*
//          * if (orderby.equalsIgnoreCase("branch")) orderby = "branchname";
//          */
//     Database db = await initDatabase();
//     String query =
//         "SELECT INS_Cutoff.CutoffID as $COLUMN_ID ,INS_College.CollegeID as $COLUMN_COLLEGEID ,INS_Branch.DegreeName as $COLUMN_DEGREENAME ,INS_College.CollegeShortName|| CASE WHEN MST_Board.BoardNameSystem IS NULL OR LENGTH(MST_Board.BoardNameSystem) = 0 then '' ELSE '-'||MST_Board.BoardNameSystem end as $COLUMN_COLLEGE_SHORTNAME ,CASE WHEN $category = 99999 then 'Vac.' ELSE $category END as $COLUMN_CLOSINGRANK";
//     if (quota == IntConstants.BOARD_NEET_MARKS) {
//       query =
//           "$query ,CASE WHEN $category = 99999 then -1 ELSE $category END as ${COLUMN_CLOSINGRANK}1";
//     } else {
//       query = "$query,$category as ${COLUMN_CLOSINGRANK}1";
//     }
//
//     query =
//         "$query,* FROM INS_College, INS_Branch, INS_Cutoff, MST_Board  where INS_College.CollegeID = INS_Cutoff.CollegeID  AND INS_Cutoff.BranchID = INS_Branch.BranchID  AND LENGTH($category) > 0 ";
//     if (board == "HSC") {
//       query = "$query   AND $category >= ${meritno}";
//     } else {
//       if (quota == IntConstants.BOARD_MERIT_NO) {
//         print(categoryColumnName);
//         query =
//             "$query   AND ($categoryColumnName >= ${meritno} OR $categoryColumnName = 99999)";
//       } else if (quota == IntConstants.BOARD_NEET_MARKS)
//         query = "$query   AND ($category <= ${meritno} OR $category = 99999)";
//       else
//         query = "$query   AND ($category >= ${meritno} OR $category = 99999)";
//     }
//
// //        if (LastYearCutoff.branch_value.size() > 0) {
// //            String temp = "";
// //            for (int i = 0; i < LastYearCutoff.branch_value.size(); i++) {
// //                temp = '"' + LastYearCutoff.branch_value.get(i) + '"';
// //                if (i == (LastYearCutoff.branch_value.size() - 1))
// //                    branch = branch + temp;
// //                else
// //                    branch = branch + temp + ",";
// //            }
// //        }
//
//     if (board == "HSC") {
//       query = "$query AND INS_Cutoff.BoardID in (1,2,3)";
//     } else {
//       if (quota == IntConstants.BOARD_MERIT_NO) {
//         query = "$query AND INS_Cutoff.BoardID in (4,5)";
//       } else if (quota == IntConstants.BOARD_NEET_MARKS) {
//         query = "$query AND INS_Cutoff.BoardID in (6,8)";
//       } else {
//         query = "$query AND INS_Cutoff.BoardID in (9,12)";
//       }
//     }
//
//     query = "$query AND INS_Cutoff.BoardID = MST_Board.BoardID";
//
//     if (!(collegetype.toLowerCase() == "all")) {
//       query = "$query AND INS_College.CollegeTypeID=$collegetype";
//     }
//     if (branches.length > 0) {
//       query =
//           "$query and INS_Branch.BranchID in (select BranchID from INS_Branch where BranchShortName in ($branches))";
//     }
// //        query = query + " order by " + category;
//     if (quota != IntConstants.BOARD_NEET_MARKS) {
//       query =
//           "$query order by ClosingRank1 ASC, INS_Branch.BranchID, INS_College.CollegeShortName";
//     } else {
//       query =
//           "$query order by ClosingRank1 DESC, INS_Branch.BranchID, INS_College.CollegeShortName";
//     }
//     print("QueryCuttofSearch $query");
//     dynamic cursor_access_database = await db.rawQuery(query, null);
//     // if (cursor_access_database != null) {
//     //   cursor_access_database.moveToFirst();
//     // }
//
//     db.close();
//     return cursor_access_database;
//   }

  Future<dynamic> filter_college(
      {required int meritno,
      required int category,
      required String board,
      required String collegetype,
      required String inputText,
      required int quota,
      required String branches}) async {
    String categoryColumnName = "";
    if (category == 1) {
      categoryColumnName = "OPENClosing";
    } else if (category == 2) {
      categoryColumnName = "EBCClosing";
    } else if (category == 3) {
      categoryColumnName = "SEBCClosing";
    } else if (category == 4) {
      categoryColumnName = "SCClosing";
    } else if (category == 5) {
      categoryColumnName = "STClosing";
    }
    String collegename = inputText;
    Database db = await initDatabase();
    String query =
        "SELECT  INS_Cutoff.CutoffID as $COLUMN_ID,INS_College.CollegeID as $COLUMN_COLLEGEID,INS_Branch.DegreeName as $COLUMN_DEGREENAME,INS_College.CollegeShortName|| CASE WHEN MST_Board.BoardNameSystem ISNULL OR LENGTH(MST_Board.BoardNameSystem) = 0 then '' ELSE '-'|| MST_Board.BoardNameSystem end as $COLUMN_COLLEGE_SHORTNAME,CASE WHEN $category = 99999 then 'Vac.' WHEN Length($category) = 0 then '-' ELSE $category END as $COLUMN_CLOSINGRANK";
    if (quota == IntConstants.BOARD_NEET_MARKS) {
      query =
          "$query ,CASE WHEN $category = 99999 then -1 ELSE $category END as ${COLUMN_CLOSINGRANK}1";
    } else {
      query = "$query,$category as ${COLUMN_CLOSINGRANK}1";
    }
    query =
        "$query FROM  INS_College, INS_Branch,INS_Cutoff, MST_Board WHERE  INS_College.CollegeID = INS_Cutoff.CollegeID  and INS_Cutoff.BranchID = INS_Branch.BranchID AND LENGTH($category) >0 and (INS_Branch.DegreeName like '%$collegename%' or INS_Branch.BranchShortName like '%$collegename%' or INS_Branch.BranchName like '%$collegename%' or INS_College.CollegeCode like '%$collegename%' or INS_College.CollegeShortName like '%$collegename%' or INS_College.CollegeName like '%$collegename%' or INS_College.CollegeCode like '%$collegename%')";

    if (board == "HSC") {
      query = "$query   AND $categoryColumnName >= $meritno";
    } else {
      if (quota == IntConstants.BOARD_MERIT_NO) {
        query = "$query   AND $categoryColumnName >= $meritno";
      } else if (quota == IntConstants.BOARD_NEET_MARKS) {
        query = "$query   AND $category <= $meritno";
      } else {
        query = "$query   AND $category >= $meritno";
      }
    }
    if (board == ("HSC")) {
      query = "$query AND INS_Cutoff.BoardID in (1,2,3)";
    } else {
      if (quota == IntConstants.BOARD_MERIT_NO) {
        query = "$query AND INS_Cutoff.BoardID in (4,5)";
      } else if (quota == IntConstants.BOARD_NEET_MARKS) {
        query = "$query AND INS_Cutoff.BoardID in (6,8)";
      } else {
        query = "$query AND INS_Cutoff.BoardID in (9,12)";
      }
    }

    query = "$query AND INS_Cutoff.BoardID = MST_Board.BoardID";

    if (!(collegetype.toLowerCase() == "all")) {
      query = "$query and INS_College.CollegeTypeID=$collegetype";
    }
    if (branches.isNotEmpty) {
      query =
          "$query and INS_Branch.BranchID in (select BranchID from INS_Branch where BranchShortName in ($branches))";
    }
//        query = query + " order by " + category;
    if (quota != IntConstants.BOARD_NEET_MARKS) {
      query =
          "$query order by ClosingRank1 ASC, INS_Branch.BranchID, INS_College.CollegeShortName";
    } else {
      query =
          "$query order by ClosingRank1 desc, INS_Branch.BranchID, INS_College.CollegeShortName";
    }
    print("QueryCutOffSearch  ::::  $query");
    dynamic cursor_access_database = await db.rawQuery(query, null);
    if (cursor_access_database == null) {
      cursor_access_database.moveToFirst();
    }
    return cursor_access_database;
  }

  void onUpgrade(MyDatabase db, int oldVersion, int newVersion) {}
}
