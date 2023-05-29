class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  void sayHello() {
    print("Hello, my name is $name.");
  }

  int getAgeInMonths() {
    return age * 12;
  }
}

void main() {
  Person person = Person("Sabrina Jahan", 25,"Moheshkhali, Cox's Bazar");
  person.sayHello();
  print("Age in months: ${person.getAgeInMonths()}");
}
