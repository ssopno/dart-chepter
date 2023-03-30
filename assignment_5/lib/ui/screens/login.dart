





import 'package:flutter/material.dart';
import 'package:untitled/data/auth_utils.dart';
import 'package:untitled/ui/screens/signup_screen.dart';
import 'package:untitled/ui/screens/varify_with_email_screen.dart';
import 'package:untitled/ui/utils/snackber_message.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/text_style.dart';
import '../widget/app_Text_field_widget.dart';
import '../widget/app_elevated_button.dart';
import '../widget/screen_background_widget.dart';
import 'main_bottom_nav_ber.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final TextEditingController _emailETController=TextEditingController();
final TextEditingController _passwordETController=TextEditingController();


final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

bool _inProgress =  false;


Future<void>login() async {
  _inProgress = true;
  setState(() {

  });
  final result = await NetworkUtils().postMethod(
      Urls.loginUrl,
      body: {
        'email':_emailETController.text.trim(),
        'password':_passwordETController.text
      },
      onUnAuthorize: (){
        showSnackBarMessage(context,'Username or password incorrect',true );
      });
  _inProgress = false;
  setState(() {

  });

          if(result != null && result['status']== 'success') {
            await AuthUtils.saveUserData(
                result['data']['firstName'],
                result['data']['lastName'],
                result['token'],
                result['data']['photo'],
                result['data']['mobile'],
                result['data']['email'],
            );
          if(mounted){
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(
                builder: (context) => const MainBottomNavBar()), (
                route) => false);
            }
           }
          }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started With',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                    hintText: 'email',
                    controller:_emailETController,
                  validator:(value) {
                    if(value?.isEmpty ?? true){
                      return 'Enter your valid email ';
                    }
                    return null;
                  },


                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Password',
                  controller: _passwordETController,
                  validator:(value) {
                    if((value?.isEmpty ?? true) && (( value?.length ?? 0)<6)){
                      return 'Enter password more then 6';
                    }
                    return null;
                  },

                ),
                const SizedBox(
                  height: 16,
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
                  onTap: ()   async {
                    if(_formKey.currentState!.validate()) {
                      login();
                    }

                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const VerifyWithEmailScreen()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}












