

import 'package:flutter/material.dart';
import 'package:untitled/ui/widget/deleted_task.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../widget/dashboard_item.dart';
import '../widget/screen_background_widget.dart';
import '../widget/status_change_bottom_sheet.dart';
import '../widget/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {



  TaskModels newTaskModel = TaskModels();
  TaskModels completeTaskModel = TaskModels();
  TaskModels cancelledTaskModel = TaskModels();
  TaskModels progressTaskModel = TaskModels();

  bool inProgress = false;
  int? newTaskNumber;
  int? completeTaskNumber;
   int? cancelledTaskNumber;
   int? progressTaskNumber;

  @override
  void initState() {
    super.initState();
    getAllNewTasks();
  }

  Future<void> getAllNewTasks() async {
    inProgress = true;
    setState(() {});
    final newTaskResponse = await NetworkUtils().getMethod(
      Urls.newTaskUrl,
    );
    final completeTaskResponse = await NetworkUtils().getMethod(
      Urls.completeTaskUrl,
    );
    final cancelledTaskResponse = await NetworkUtils().getMethod(
      Urls.cancelledTaskUrl,
    );
    final progressTaskResponse = await NetworkUtils().getMethod(
      Urls.progressTaskUrl,
    );

    if (newTaskResponse != null && completeTaskResponse != null && cancelledTaskResponse != null && progressTaskResponse != null) {
      newTaskModel = TaskModels.fromJson(newTaskResponse);
      completeTaskModel = TaskModels.fromJson(completeTaskResponse);
      cancelledTaskModel = TaskModels.fromJson(cancelledTaskResponse);
      progressTaskModel = TaskModels.fromJson(progressTaskResponse);
      newTaskNumber = newTaskModel.data?.length??0;
      completeTaskNumber = completeTaskModel.data?.length??0;
      cancelledTaskNumber = cancelledTaskModel.data?.length??0;
      progressTaskNumber = progressTaskModel.data?.length??0;
    } else {
      if(mounted){
      showSnackBarMessage(context, 'Unable to fetch new tasks! try again');
    }
    }
    inProgress = false;
    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'New',
                  numberOfTasks:  newTaskNumber??0,
                ),
              ),
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'Completed',
                  numberOfTasks:completeTaskNumber??0 ,
                ),
              ),
               Expanded(
                child: DashboardItem(
                  typeOfTask: 'Cancelled',
                  numberOfTasks: cancelledTaskNumber??0 ,
                ),
              ),
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'In Progress',
                  numberOfTasks:progressTaskNumber??0,
                ),
              ),

            ],
          ),
          Expanded(
              child: inProgress?const Center(
                child: CircularProgressIndicator(

                ),
              ):RefreshIndicator(
                onRefresh:()async{
                  getAllNewTasks();
                },
                child: ListView.builder(
                    itemCount: newTaskModel.data?.length??0,
                    itemBuilder: (context,index){
                      return  TaskListItem(
                        type: 'New',
                        date: newTaskModel.data?[index].createdDate??
                            'UnKnown',
                        description:newTaskModel.data?[index].description??
                            'UnKnown' ,
                        subject:newTaskModel.data?[index].title??
                            'UnKnown',
                        onDeletePress: (){
                          onTaskDeleted(context, newTaskModel.data?[index].title,
                              newTaskModel.data?[index].sId, (){
                                getAllNewTasks();
                              });
                        },
                        onEditPress: (){
                            showChangeTaskStatus(
                              'New',

                                newTaskModel.data?[index].sId?? '',
                                  (){
                                getAllNewTasks();
                            });
                        },
                        colors: Colors.blue,
                      );
                    }),
              )
          )
        ],
      ),
    );
  }

 /* Future<void> deleteItem (int index) async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('confirm delete?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {


                  },
                  leading: const Icon(Icons.delete_forever),
                  title:const  Text('Yes') ,
                ),
                ListTile(
                  onTap: () async {



                  },
                  leading:const Icon(Icons.backspace_sharp) ,
                  title: const Text('No') ,
                )
              ],
            ),
          );
        });




  }*/


}


