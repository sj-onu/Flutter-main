String studentGrade(String name, int score) {
  if (score < 0 || score > 100) {
    return "Invalid Grade";
  } else if (score >= 90) {
    return "${name}'s grade is A";
  } else if (score >= 80) {
    return "${name}'s grade is B";
  } else if (score >= 70) {
    return "${name}'s grade is C";
  } else if (score >= 60) {
    return "${name}'s grade is D";
  } else {
    return "${name}'s grade is F";
  }
}