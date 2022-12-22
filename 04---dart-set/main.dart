///dart set

void main(){
  Set<String>names ={'Shathi','ricky','adam','Shathi'};
  print(names);
  ///add
  names.add('rahim');
  print(names);
  ///addAll
  names.addAll({'fardin','ammu','abbu'});
  print(names);
  ///element
  var x=names.elementAt(2);
  print(x);
  ///remove-set
  names.remove('fardin');
  print(names);
  names.clear();
  print(names);

  Set<String>namess ={'Shathi','ricky','adam','Shathi'};
  print(namess);
  print(namess.last);
  print(namess.length);
  print(namess.isEmpty);
  print(namess.isNotEmpty);
  print(namess.first);
}
