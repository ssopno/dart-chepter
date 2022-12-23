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



    List<String> friends = [
    'Miraz',
    'Hasan',
    'Miraz',
    'Hasan',
    'Rahat',
    'Sammun'
  ];
  print(friends);

  Set<String> unqFriends = {
    'Miraz',
    'Hasan',
    'Miraz',
    'Hasan',
    'Rahat',
    'Sammun'
  };
  print(unqFriends);

  // adding elements in set
  unqFriends.add('Jakir');
  print(unqFriends);
  unqFriends.addAll({'Ohi', 'Rayian', 'Sayem'});
  print(unqFriends);

  // accessing elements in set
  print(unqFriends.first);
  print(unqFriends.last);
  print(unqFriends.elementAt(2));

  // removing elements in set
  unqFriends.remove('Hasan');
  print(unqFriends);
  unqFriends.removeAll({'Miraz', 'Rayian', 'Sayem'});
  print(unqFriends);

  // isEmpty, isNotEmpty, Length
  print(unqFriends.isEmpty);
  print(unqFriends.isNotEmpty);
  print(unqFriends.length);

  // clear the set
  unqFriends.clear();
  print(unqFriends);
}
