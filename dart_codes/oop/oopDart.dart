class Car {
  String brand;
  String model;
  int year;
  double milesDriven;
  static int numberOfCars = 0;


  Car(this.brand, this.model, this.year, {this.milesDriven = 0.0}) {
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    return currentYear - year;
  }
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 2019);
  car1.drive(1000.67);

  Car car2 = Car('Lamborghini', 'Aventador', 2017);
  car2.drive(5500.20);

  Car car3 = Car('Ferrari', '458 Spider', 2022);
  car3.drive(100.7);

  print('Car 1: ${car1.getBrand()} ${car1.getModel()} ${car1.getYear()}, Miles Driven: ${car1.getMilesDriven()}, Age: ${car1.getAge()}');
  print('Car 2: ${car2.getBrand()} ${car2.getModel()} ${car2.getYear()}, Miles Driven: ${car2.getMilesDriven()}, Age: ${car2.getAge()}');
  print('Car 3: ${car3.getBrand()} ${car3.getModel()} ${car3.getYear()}, Miles Driven: ${car3.getMilesDriven()}, Age: ${car3.getAge()}');

  print('Total number of cars created: ${Car.numberOfCars}');
}
