import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../widget/deleted_task.dart';
import '../widget/screen_background_widget.dart';
import '../widget/status_change_bottom_sheet.dart';
import '../widget/task_list_item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  TaskModels cancelledTaskModel = TaskModels();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllCancelledTasks();
  }

  Future<void> getAllCancelledTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.cancelledTaskUrl,
    );
    if (response != null) {
      cancelledTaskModel = TaskModels.fromJson(response);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBarMessage(context, 'Unable to fetch Cancelled tasks! try again');
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
          getAllCancelledTasks();
        },
        child: ListView.builder(
            itemCount: cancelledTaskModel.data?.length??0,
            itemBuilder: (context,index){
              return  TaskListItem(
                type: 'Cancelled',
                date: cancelledTaskModel.data?[index].createdDate?? 'UnKnown',
                description:cancelledTaskModel.data?[index].description?? 'UnKnown' ,
                subject:cancelledTaskModel.data?[index].title?? 'UnKnown',
                onDeletePress: (){
                  onTaskDeleted(context, cancelledTaskModel.data?[index].title,
                      cancelledTaskModel.data?[index].sId, (){
                        getAllCancelledTasks();
                      });
                },
                onEditPress: (){
                  showChangeTaskStatus(
                      'Cancelled',
                      cancelledTaskModel.data?[index].sId?? '',
                          () {
                        getAllCancelledTasks();
                      }
                  );
                }, colors: Colors.red,
              );
            }),
      ),
    );
  }
}
