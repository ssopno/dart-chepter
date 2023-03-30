import 'package:flutter/material.dart';
import 'package:untitled/data/network_utils.dart';
import 'package:untitled/data/urls.dart';
import 'package:untitled/ui/screens/login.dart';
import 'package:untitled/ui/utils/snackber_message.dart';
import '../utils/text_style.dart';
import '../widget/app_Text_field_widget.dart';
import '../widget/app_elevated_button.dart';
import '../widget/screen_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController emailETController = TextEditingController();
  final TextEditingController firstNameETController = TextEditingController();
  final TextEditingController lastNameETController = TextEditingController();
  final TextEditingController mobilETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress =  false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child:Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 32,),
                    Text('Join with us',style: screenTitleTextStyle ,),
                    const SizedBox(height:24 ,),
                    AppTextFieldWidget(
                        hintText: 'Email',
                        controller: emailETController ,
                       validator:(value) {
                          if(value?.isEmpty ?? true){
                            return 'Enter your valid email ';
                          }
                          return null;
                       },
                    ),
                    const SizedBox(height: 10),
                    AppTextFieldWidget(
                        hintText: 'First name',
                        controller:firstNameETController,
                      validator:(value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter your first name ';
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 10),
                    AppTextFieldWidget(
                        hintText: 'Last name',
                        controller: lastNameETController,
                      validator:(value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter your last name ';
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 10),
                    AppTextFieldWidget(
                        hintText: 'Mobile',
                        controller: mobilETController,
                      validator:(value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter your valid number ';
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 10),
                    AppTextFieldWidget(
                      hintText: 'Password',
                      controller: passwordETController,
                      validator:(value) {
                        if((value?.isEmpty ?? true) && (( value?.length ?? 0)<6)){
                          return 'Enter password more then 6';
                        }
                        return null;
                      },


                    ),
                    const SizedBox(
                        height:8
                    ),
                      if(_inProgress)
                       const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )

                      else
                         AppElevatedButton(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: ()  async {
                            if(_formKey.currentState !.validate()){
                                 _inProgress =true;
                                 setState(() {

                                 });

                              final result = await NetworkUtils().postMethod(
                                  Urls.registrationUrl,
                                  body:{
                                    'email':emailETController.text.trim(),
                                    'firstName':firstNameETController.text.trim(),
                                    'lastName':lastNameETController.text.trim(),
                                    'mobile':mobilETController.text.trim(),
                                    'password':passwordETController.text,

                                  } );

                                 _inProgress =false;
                                 setState(() {

                                 });
                                  if (result !=null && result['status']=='success'){
                                    emailETController.clear();
                                    firstNameETController.clear();
                                    lastNameETController.clear();
                                    mobilETController.clear();
                                    passwordETController.clear();
                                    if(mounted){
                                    showSnackBarMessage(context, 'Registration Successful !');
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                                  }
                                  }else{
                                    if(mounted){
                                    showSnackBarMessage(context, 'Registration failed ! Try again',true);
                                  }
                                  }

                            }
                          }
                          ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have account?"),
                        TextButton(
                            child: const Text('Sign In',style: TextStyle(color: Colors.green),),
                            onPressed: (){
                              Navigator.pop(context);
                            })
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        ),


      ),
    );
  }
}
