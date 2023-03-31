import 'package:flutter/material.dart';


import '../widget/user_profile_widget.dart';
import 'add_new_task.dart';
import 'cencelled_task_screen.dart';
import 'complete_task_screen.dart';
import 'inprogress_task_screen.dart';
import 'new_task_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedScreen = 0;
  final List<Widget>_screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    InProgressTaskScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(child:_screens[_selectedScreen],)
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTaskScreen()));
        },
         child:Icon(Icons.add),
        backgroundColor: Colors.green,
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38 ,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _selectedScreen=index;
          setState(() {

          });
        },
        elevation:4,
        currentIndex: _selectedScreen,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "New"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outlined),
              label: "Completed"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined),
              label: "Canceled"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded),
              label: "Progress"
          ),

        ],
      ),
    );
  }
}


