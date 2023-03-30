import 'package:flutter/material.dart';
import 'package:untitled/ui/widget/status_change_bottom_sheet.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../widget/deleted_task.dart';
import '../widget/screen_background_widget.dart';
import '../widget/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  TaskModels completedTaskModel = TaskModels();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllCompletedTasks();
  }

  Future<void> getAllCompletedTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.completeTaskUrl,
    );
    if (response != null) {
      completedTaskModel = TaskModels.fromJson(response);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBarMessage(context, 'Unable to fetch completed tasks! try again');
    }
    inProgress = false;
    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: inProgress?const Center(
        child: CircularProgressIndicator(

        ),
      ):RefreshIndicator(
        onRefresh:()async{
          getAllCompletedTasks();
        },
        child: ListView.builder(
            itemCount: completedTaskModel.data?.length??0,
            itemBuilder: (context,index){
              return  TaskListItem(
                type: 'Completed',
                date: completedTaskModel.data?[index].createdDate?? 'UnKnown',
                description:completedTaskModel.data?[index].description?? 'UnKnown' ,
                subject:completedTaskModel.data?[index].title?? 'UnKnown',
                onDeletePress: (){
                  onTaskDeleted(context, completedTaskModel.data?[index].title,
                      completedTaskModel.data?[index].sId, (){
                        getAllCompletedTasks();
                      });
                },
                onEditPress: (){
                  showChangeTaskStatus(
                    'Completed',
                      completedTaskModel.data?[index].sId?? '',
                          () {
                    getAllCompletedTasks();
                          }
                  );
                }, colors: Colors.green,
              );
            }),
      ),
    );
  }
}
