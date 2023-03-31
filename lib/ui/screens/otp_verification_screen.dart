



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/ui/screens/reset_password_screen.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackber_message.dart';
import '../utils/text_style.dart';
import '../widget/app_elevated_button.dart';
import '../widget/screen_background_widget.dart';
import 'login.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpPinETController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pin Verification',style:screenTitleTextStyle ,),
                    const SizedBox(height:8,),
                    Text('A 6 digit pin has been send to your mobile number',style:screenSubTitleStyle ),
                    const SizedBox(height: 24,),

                    PinCodeTextField(
                      controller: _otpPinETController,
                      appContext:context,
                      length:6,
                      pinTheme:appOTPStyle(),
                      animationType:AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill:true,
                      onCompleted:(v){
                        log('Completed');
                      },
                      onChanged: ( value) {
                        log(value);
                        setState(() {});
                      },
                      beforeTextPaste: (text){
                        log('Allowing to paste $text');
                        return true;
                      },
                    ),

                    const SizedBox(height: 16,),
                 
                    
                    AppElevatedButton(
                        child: const Text('Verify'),
                        onTap: ()async{
                         final response = await NetworkUtils().getMethod(
                             Urls.recoverVerifyOTPUrl(
                               widget.email,
                               _otpPinETController.text.trim(),
                             ),
                         );
                         if (response != null && response['status']=='success'){
                           if(mounted){
                             showSnackBarMessage(context,'otp verification done' );
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context)=>
                                     ResetPasswordScreen(
                                       email: widget.email,
                                       otp: _otpPinETController.text.trim(),
                                     ),
                                 ),
                             );
                           }
                         }else{
                           if(mounted){
                             showSnackBarMessage(context, 'OTP verification failed ! Try again');
                           }
                         }

                        }),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have account?"),
                        TextButton(
                            child: const Text('Sign In',style: TextStyle(color: Colors.green),),
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                            })
                      ],
                    )





                  ])
          ),
        ),
      ),
    );
  }
}
