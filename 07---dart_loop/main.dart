void main(){
  ///for loop
  for(int i=0;i<=10; i++){
    print(i);
  }

  ///for in loop
  /////list
  var list1=[10,20,30,40];
  for(var i in list1){
    print(i);
  }
///map
  var student=[
  {'name':'rain','age':36},
  {'name':'zain','age':26},
  {'name':'bain','age':16},
  {'name':'sain','age':6}
  ];

  for(var i in student){
    var name=i['name'];
    print(name);
  }
  //set

  var nams= {"jems","shathi",'fardin'};
  for(var i in nams){
    print(i);
  }

  for (var i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }

  for (var i = 1; i <= 10; i++) {
    if (i == 5) {
      break;
    }
    print(i);
  }

  ///while-loop
  var i = 0;
  while (i < 10) {
    print(i);
    i++;
  }

  do {
    print(i);
    i++;
  } while (i < 10);

  ///loop
  // print 1 to 5
  for (var i = 1; i <= 5; i++) {
    print("Number : $i");
  }

  // print 6 to 10
  int a = 6;
  while (a <= 10) {
    print(a);
    a++;
  }

  // print 11 to 15

  int i1 = 11;

  do {
    print(i1);
    i1++;
  } while (i1 <= 15);

  // another way to printing list item

  List<String> fruits = ["Mango", "Jackfruit", "Pineapple", "Watermelon"];
  for (int i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }

  List<String> versityName = ["SUST", "BUET", "RUET", "CUET"];

  versityName.forEach((element) {
    print(element);
  });

  print("\nStandard way\n");

  // standard way
  for (var value in versityName) {
    print(value);
  }



  }