import 'package:flutter/material.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';

void onTaskDeleted(context, taskTitle, taskId, voidCalBack){


  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete!'),
      content:  Text('Do you want to deleted this Task? \n\n" $taskTitle" '),
      actions: <Widget>[
        TextButton(
          onPressed: () =>


              Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {

            final deletedResponse = await NetworkUtils().getMethod(
                Urls.deleteTask(taskId));

            if(deletedResponse!=null){
              voidCalBack();
              Navigator.pop(context, 'OK');
            }

          },
          child: const Text('OK'),
        ),
      ],
    ),
  );








}