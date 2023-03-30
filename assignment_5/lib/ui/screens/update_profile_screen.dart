import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/data/auth_utils.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../utils/text_style.dart';
import '../widget/app_Text_field_widget.dart';
import '../widget/app_elevated_button.dart';
import '../widget/screen_background_widget.dart';
import '../widget/user_profile_widget.dart';
import 'main_bottom_nav_ber.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool inProgress = false;

   XFile? pickedImage;
   String? base64Image;


  @override
  void initState() {
    super.initState();
    _emailETController.text = AuthUtils.email?? '';
    _firstNameETController.text = AuthUtils.firstName??'';
    _lastNameETController.text = AuthUtils.lastName??'';
    _mobileETController.text = AuthUtils.mobile??'';
  }

  Future<void> updateProfile() async {
    if(pickedImage != null) {
      List<int> imageBytes = await pickedImage!.readAsBytes();
      print(imageBytes);
      base64Image = base64Encode(imageBytes);
      print(base64Image);
    }

    Map<String, String>bodyParams={
      'email': _emailETController.text.trim(),
      'firstName': _firstNameETController.text.trim(),
      'lastName': _lastNameETController.text.trim(),
      'mobile': _mobileETController.text.trim(),
      'photo': base64Image ?? ''
    };
    if(_passwordETController.text.isNotEmpty){
      bodyParams['password'] = _passwordETController.text;
    }

    if(_formKey.currentState !.validate()){
      inProgress =true;
      setState(() {

      });
    final result = await NetworkUtils().postMethod(
        Urls.profileUpdateTaskUrl,
        body:bodyParams);



      inProgress =false;
      setState(() {

      });


       if(result != null && result['status']=='success') {
        if(mounted) {
          showSnackBarMessage(context, 'profile data updated');
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(
              builder: (context) => const MainBottomNavBar()), (
              route) => false);
        }
       }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const  UserProfileWidget(),
              Expanded(child: ScreenBackground(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const  SizedBox(height: 24,),
                        Text(
                          ' Update Profile',
                          style: screenTitleTextStyle ,
                        ),
                        const SizedBox(height: 16,),
                        InkWell(
                          onTap: () async {
                            pickImage();
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:  const EdgeInsets.all(16),
                                decoration:const  BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft:Radius.circular(8),
                                    bottomLeft:Radius.circular(8),

                                  ),
                                  color: Colors.grey,
                                ),
                                child:const Text('photo'),

                              ),
                              Expanded(
                                child: Container(
                                  padding:  const EdgeInsets.all(16),
                                  decoration:const  BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:Radius.circular(8),
                                      bottomRight:Radius.circular(8),

                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Text(pickedImage?.name??'',maxLines: 1,style: const TextStyle(
                                    overflow: TextOverflow.ellipsis
                                  ),),

                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(height: 8,),
                        AppTextFieldWidget(
                            hintText: 'Email',
                            controller: _emailETController,
                             readOnly:true,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your last name ';
                            }
                            return null;
                          },


                        ),
                        const SizedBox(height: 8,),
                        AppTextFieldWidget(
                            hintText: 'First Name',
                            controller: _firstNameETController,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your first name ';
                            }
                            return null;
                          },

                        ),
                        const SizedBox(height: 8,),
                        AppTextFieldWidget(
                            hintText: 'Last Name',
                            controller: _lastNameETController,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your last name ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8,),
                        AppTextFieldWidget(
                            hintText: 'Mobile',
                            controller: _mobileETController,
                          validator:(value) {
                            if(value?.isEmpty ?? true){
                              return 'Enter your valid number ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8,),
                        AppTextFieldWidget(
                            hintText: 'Password',
                            obscureText: true,
                            controller: _passwordETController,
                          validator:(value) {
                            if((value?.isEmpty ?? true) && (( value?.length ?? 0)<6)){
                              return 'Enter password more then 6';
                            }
                            return null;
                          },
                        ),
                        if(inProgress)
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          )
                        else
                        AppElevatedButton(
                            child: const Icon(Icons.arrow_circle_right_outlined),
                            onTap: ()  {
                              updateProfile();
                            })


                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage () async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('pick image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if(pickedImage !=null){
                      setState(() {});
                    }
                  },
                  leading: const Icon(Icons.camera),
                  title:const  Text('camera') ,
                ),
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if(pickedImage !=null){
                      setState(() {});
                    }
                  },
                  leading:const Icon(Icons.image) ,
                  title: const Text('Gallery') ,
                )
              ],
            ),
          );
        });




  }
}
