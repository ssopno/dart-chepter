void main() {


  ///dart number
  ////integer/double
  var intNumber = 10;
  var doubleNumber = 10.10;
  print(intNumber);
  print(doubleNumber);

  ///dart string
  var MyStringSingle='this is a single sting';
  var mystringdoble="this is a double string";


  // type non safety
  var fname = "shathi";
  dynamic lname = "islam";
  var age = 25;

  print(fname + " " + lname);
  print(age);

  // type safety

  // string
  String name1 = "Shathi";
  String name2 = "islam";
  print(name1 + " " + name2);

  // integer
  final int age2 = 25;
  print(age2);
  //age2 = 22;

  // double
  double sscGpa = 4.83;
  print(sscGpa);

  // boolean for true / false
  bool ans = false;
  print(ans);

  //operators
  int a = 82;
  int b = 10;

  int c = a + b;
  print(c);

  int d = a - b;
  print(d);

  int e = a * b;
  print(e);

}
