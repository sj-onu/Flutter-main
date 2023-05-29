main() {

  String studentName = "Sabrina Jahan";
  int testScore = 92;

  String grade = studentGrade(studentName, testScore);

  print("$grade");
}

String studentGrade(String studentName, int testScore) {
  if (testScore >= 90 && testScore <=100) {
    return "$studentName's grade is 'A'";
  } else if (testScore >= 80 && testScore <=89) {
    return "$studentName's grade is 'B'";
  } else if (testScore >= 70 && testScore <=79) {
    return "$studentName's grade is 'C'";
  } else if (testScore >= 60 && testScore <=69) {
    return "$studentName's grade is 'D'";
  } else if (testScore >= 0 && testScore <=59) {
    return "$studentName's grade is 'F'";
  } else{
    return "Invalid";
  }
}

