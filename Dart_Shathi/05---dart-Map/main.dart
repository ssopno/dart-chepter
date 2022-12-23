///Map

//
void main(){
  var student = {'name':'Tom','age':'23'};
  student['course']='B.tech';
  print(student);

  ///Map constructor

  var students = new Map();
  students['name'] = 'Tom';
  students['age'] = '23';
  students['course']= 'B.tech’';
  students['Branch']= 'Computer';
  print(students);

  ///Map methods
  ///addAll
  students.addAll({'name':'tom','age':23,'course':'flutter'});
  print(students);
  students.clear();
  print(students);
  ///map-remove
  var mystudent = {'name':'Tom','age':'23'};
  mystudent['course']='B.tech';
  print(student);
  mystudent.remove('age');
  print(mystudent);

  /// map --> key,value pair
  Map<int, int> keys = {1: 1, 2: 2, 3: 3};
  print(keys.keys);

  Map<String, int> friendsAge = {"hasan": 21, "rahat": 22};
  print(friendsAge);
  print(friendsAge["hasan"]);

  Map<int, Map<String, int>> id = {
    2122020030: {"Hasan": 21},
    2122020020: {"Rahat": 22}
  };
  print(id[2122020020]);




}
