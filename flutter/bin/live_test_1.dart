main() {
  Map <String,dynamic> employee={
    'Id': 1,
    'Name': 'Sabrina Jahan',
    'Age': 24,
    'Salary': 57550.50,
    'Gender': 'Female'
  };
  int id = employee['Id'];
  int age = employee['Age'];
  double salary = employee['Salary'];

  print('Salary of employee is $salary .');
}