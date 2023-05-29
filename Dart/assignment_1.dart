main() {
  List<String> phoneNumber = ["+88", "01768131685", "01768171985","+88", "01768111286", "01768131685"];
  for (String number in phoneNumber) {
    if (number != "+88"){
      print('+88$number');
    }
  }
  }