
import 'package:flutter/material.dart';
import 'package:untitled/data/network_utils.dart';
import 'package:untitled/data/urls.dart';
import 'package:untitled/ui/utils/snackber_message.dart';

import '../utils/text_style.dart';
import '../widget/app_elevated_button.dart';
import '../widget/app_text_field_widget.dart';
import '../widget/screen_background_widget.dart';
import '../widget/user_profile_widget.dart';
import 'main_bottom_nav_ber.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController subjectETController = TextEditingController();
  final TextEditingController descriptionETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const  UserProfileWidget(),
            Expanded(child: ScreenBackground(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const  SizedBox(height: 24,),
                        Text(
                          'Add New Task',
                          style: screenTitleTextStyle ,
                        ),
                        const SizedBox(height: 16,),
                        AppTextFieldWidget(
                            hintText: 'Subject',
                            controller: subjectETController,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your  subject ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        AppTextFieldWidget(hintText: 'description',
                          controller: descriptionETController,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your  description ';
                            }
                            return null;
                          },

                          maxlines:5 ,
                        ),
                        const SizedBox(height: 16,),
                        if (_inProgress)
                         const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          )
                        else
                        AppElevatedButton(
                            child: const Icon(Icons.arrow_circle_right_outlined),
                            onTap: () async {
                              if(_formKey.currentState!.validate()){
                                _inProgress = true;
                                setState(() {

                                });
                                final result = await NetworkUtils().postMethod(
                                  Urls.createNewTaskUrl,
                                  body: {
                                    "title":subjectETController.text.trim(),
                                    "description":descriptionETController.text.trim(),
                                    "status":"New"
                                  }
                                );
                                _inProgress = false;
                                setState(() {

                                });
                                if(result != null && result['status'] == 'success'){
                                  subjectETController.clear();
                                  descriptionETController.clear();
                                  if(mounted) {
                                    showSnackBarMessage(
                                        context, 'add new task successful !');
                                    Navigator.pushAndRemoveUntil(
                                        context, MaterialPageRoute(
                                        builder: (
                                            context) => const MainBottomNavBar()), (
                                        route) => false);
                                  }

                                }else{
                                  if(mounted){
                                  showSnackBarMessage(context, 'new task add failed ! Try again',true);
                                }
                                }


                              }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
