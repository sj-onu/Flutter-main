main() {

  String studentName = "Sabrina Jahan";
  int testScore = 55;

  String grade = studentGrade(studentName, testScore);

  print("$studentName's grade: $grade");
}

String studentGrade(String studentName, int testScore) {
  if (testScore >= 90 && testScore <=100) {
    return "${studentName}'s grade is A";
  } else if (testScore >= 80 && testScore <=89) {
    return "${studentName}'s grade is B";
  } else if (testScore >= 70 && testScore <=79) {
    return "${studentName}'s grade is C";
  } else if (testScore >= 60 && testScore <=69) {
    return "${studentName}'s grade is D";
  } else {
    return "${studentName}'s grade is F";
  }
}

