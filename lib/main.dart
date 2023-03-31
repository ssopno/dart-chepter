
import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/splashScreen.dart';



void main(){
  runApp( const TaskManagerApp());
}


class TaskManagerApp extends StatefulWidget {

 const TaskManagerApp({Key? key}) : super(key: key);


 static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      home:const SplashScreen(),
    );
  }
}
