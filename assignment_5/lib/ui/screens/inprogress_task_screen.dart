import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../widget/deleted_task.dart';
import '../widget/screen_background_widget.dart';
import '../widget/status_change_bottom_sheet.dart';
import '../widget/task_list_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  TaskModels progressTaskModel = TaskModels();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllProgressTasks();
  }

  Future<void> getAllProgressTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.progressTaskUrl,
    );
    if (response != null) {
      progressTaskModel = TaskModels.fromJson(response);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBarMessage(context, 'Unable to fetch in Progress tasks! try again');
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
          getAllProgressTasks();
        },
        child: ListView.builder(
            itemCount: progressTaskModel.data?.length??0,
            itemBuilder: (context,index){
              return  TaskListItem(
                type: 'Progress',
                date: progressTaskModel.data?[index].createdDate?? 'UnKnown',
                description:progressTaskModel.data?[index].description?? 'UnKnown' ,
                subject:progressTaskModel.data?[index].title?? 'UnKnown',
                onDeletePress: (){
                  onTaskDeleted(context, progressTaskModel.data?[index].title,
                      progressTaskModel.data?[index].sId, (){
                        getAllProgressTasks();
                      });
                },
                onEditPress: (){
                  showChangeTaskStatus(
                      'Progress',
                      progressTaskModel.data?[index].sId?? '',
                          () {
                        getAllProgressTasks();
                      }
                  );
                }, colors: Colors.yellowAccent,
              );
            }),
      ),
    );
  }
}
