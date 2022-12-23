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



  }