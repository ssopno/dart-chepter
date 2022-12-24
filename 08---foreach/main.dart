void main(){
  List<String> versityName = ["SUST", "BUET", "RUET", "CUET"];

  versityName.forEach((element) {
    print(element);
  });

  print("\nStandard way\n");

  // standard way
  for (var value in versityName) {
    print(value);
  }

  ///for loop in Map
  Map<String, int> ages = {'Dipu' : 24, 'Fahim': 28, 'Abdullah' : 23};

  ages.forEach((key, value) {
    print(key);
    print(value);
  });
}