// Create a class named Candidate with Candidate_ID, Candidate_Name, Candidate_Age,
// Candidate_Weight and Candidate_Height as data members. Create a method
// GetCandidateDetails() and DisplayCandidateDetails(). Create a main method to demonstrate
// the Candidate class.

import 'dart:io';

void main(List<String> args) {
  Candidate user = Candidate();
  user.getCandidateDetails();
  user.displayCandidateDetails();
}

class Candidate {
  String Candidate_ID = "";
  String Candidate_Name = "";
  int? Candidate_Age;
  int? Candidate_Weight;
  int? Candidate_Height;

  getCandidateDetails() {
    stdout.write("Enter Candidate_ID = ");
    Candidate_ID = stdin.readLineSync()!;
    stdout.write("Enter Candidate_Name = ");
    Candidate_Name = stdin.readLineSync()!;
    stdout.write("Enter Candidate_Age = ");
    Candidate_Age = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Candidate_Weight = ");
    Candidate_Weight = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Candidate_Height = ");
    Candidate_Height = int.parse(stdin.readLineSync()!);
  }

  displayCandidateDetails() {
    print("Id = $Candidate_ID");
    print("Candidate_Name = $Candidate_Name");
    print("Candidate_Age = $Candidate_Age");
    print("Candidate_Weight = $Candidate_Weight");
    print("Candidate_Height = $Candidate_Height");
  }
}
