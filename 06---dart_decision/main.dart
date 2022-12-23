///dart decision-Making Statement
///if Statement
void main() {
  var a = 35;
  if (a < 40) {
    print("The number is smaller than 40");
  }

  ///if else statement
  var x = 20;
  var y = 30;
  if(x > y){
    print("x is greater than y");
  } else {
    print("y is greater than x");
  }

  ///if else if
  var marks = 74;
  if(marks > 85){
    print('"Excellent');
  }else if(marks>75){
    print('very good');
  }else if (marks>65){
    print('good');
  }else{
    print('avarage');
  }

  int age = 25;

  if (age < 18) {
    print("Non eligible for development");
  } else if (age > 18 && age <= 25) {
    print("Junior developer");
  } else if (age > 25 || age <= 30) {
    print("Senior developer");
  } else {
    print("Retired");
  }

  int ages = 65;

  if (ages <= 20) {
    print('Go to first doctor');
  }
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age == 25) {}
  else if (age >= 30) {
    print('Go to second doctor');
  }
  else if (age == 60) {
    print('Go to second doctor');
  }
  else {
    print('Go to third doctor');
  }

  print('Go to home');

  ///switch
  int n=3;
  switch(n){
    case 1:
      print('value is 1');
      break;
    case 2:
      print('value is 2');
      break;
    case 3:
      print('value is 3');
      break;
    case 4:
      print('value is 4');
      break;
    default:
      print('out of range');
      break;


  }

  }




