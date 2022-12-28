
///class and objectiove...


void main(){
  var obj=MyClass();
  obj.addTwo();
  obj.addThree();
  obj.age;
}

class MyClass{
  ///variable baire dicleiar korle ata instance variaable /global variable
  ///hoi ba boal hoi.
  var name='shathi';
  var age=25;

  void addTwo(){
    var brother='fardin';
    ///ata local variable..ai methods cara use kora jabe na.
    print(brother);
    print(20+30);
  }
  void addThree(){
    print(10+20+30);
  }



}