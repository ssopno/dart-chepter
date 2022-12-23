
///List
///Fixed list

void main(){
  var list = List.filled(6, 0, growable: false);
  list[0]=12;
  print(list);
  print(list.length);

  ///Grow able list
  ///
  var listGrowable = List.filled(6, 0, growable: true);
  list[0]=12;
  print(list);
  print(list.length);

  var list1=[1,2,3,4,5];
  print(list1);
  ///list-add
  list1.add(11);
  print(list1);
  ///list-addAll
  list1.addAll([12,13,14]);
  print(list1);
  ///list-insert
  list1.insert(0, 20);
  print(list1);
  ///list-insertAll
  list1.insertAll(0, [21,22,23]);
  print(list1);
  ///list-updating list
  list1[3]=55;
  print(list1);
  ///list removing
  var list2=[1,2,3,4,5];
  print(list2);

  list2.remove(3);
  print(list2);
  ///list-removeAt
  list2.removeAt(1);
  print(list2);
  list2.removeLast();
  print(list2);

  List<String> friends = ["Hasan", "Rahat", "Sammun"];
  print(friends);
  print(friends[0]);

  ///list

  List<int> ageOfFriends = [21, 22, 23];
  print(ageOfFriends);
  List<String> list3 = ["Hasan", "Ahmad", "Juned"];
  print(list3);

  var firstItem = list3.first;
  print(firstItem);
  var lastItem = list3.last;
  print(lastItem);
  int size = list3.length;
  print(size);
  var reverse = list3.reversed;
  print(reverse);

  // add
  list3.add("rahat");
  print(list);
  list3.addAll(["sammun", "ami", "tumi"]);
  print(list3);
  list3.insert(0, "Name");
  print(list);
  list3.insertAll(2, ["ostad", "flutter", "class"]);
  print(list3);

  // list update
  list3[1] = "kohinoor";
  print(list3);

  // remove
  list3.remove("sammun");
  print(list3);
  list3.removeAt(2);
  print(list3);
  list3.removeLast();
  print(list3);

  List<String> list4 = ["Hasan", "Ahmad", "Juned"];
  print(list3);

  list4.replaceRange(1, 2, ["Leading University"]); // best option for updating
  print(list4);//updating


}