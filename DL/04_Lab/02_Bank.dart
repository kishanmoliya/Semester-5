// Create a class named Bank_Account with Account_No, User_Name, Email, Account_Type, and
// Account_Balance as data members. Also create a method GetAccountDetails() and
// DisplayAccountDetails(). Create a main method to demonstrate the Bank_Account class.

import 'dart:io';

void main(List<String> args) {
  Bank_Account user = Bank_Account();
  user.getAccountDetails();
  user.displayAccountDetails();
}

class Bank_Account {
  dynamic Account_No;
  String User_Name = "";
  String Email = "";
  String Account_Type = "";
  double? Account_Balance;

  getAccountDetails() {
    stdout.write("Enter Account_No = ");
    Account_No = (stdin.readLineSync()!);
    stdout.write("Enter User_Name = ");
    User_Name = stdin.readLineSync()!;
    stdout.write("Enter Email = ");
    Email = stdin.readLineSync()!;
    stdout.write("Enter Account_Type = ");
    Account_Type = stdin.readLineSync()!;
    stdout.write("Enter Account_Balance = ");
    Account_Balance = double.parse(stdin.readLineSync()!);
  }

  displayAccountDetails() {
    print("Id = $Account_No");
    print("User_Name = $User_Name");
    print("Email = $Email");
    print("Account_Type = $Account_Type");
    print("Account_Balance = $Account_Balance");
  }
}
