import 'package:flutter/material.dart';
import 'package:untitled/data/network_utils.dart';
import 'package:untitled/ui/utils/snackber_message.dart';
import '../../data/urls.dart';
import '../utils/text_style.dart';
import '../widget/app_Text_field_widget.dart';
import '../widget/app_elevated_button.dart';
import '../widget/screen_background_widget.dart';
import 'Otp_verification_screen.dart';

class VerifyWithEmailScreen extends StatefulWidget {
  const VerifyWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyWithEmailScreen> createState() => _VerifyWithEmailScreenState();

}

class _VerifyWithEmailScreenState extends State<VerifyWithEmailScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Email Address',style:screenTitleTextStyle ,),
                  const SizedBox(height:8,),
                  Text('A 6 digit verification pin will send to your email address',style:screenSubTitleStyle ),
                  const SizedBox(height: 24,),
                  AppTextFieldWidget(
                      hintText: 'Email Address',
                      controller: _emailETController,

                  ),
                  const SizedBox(height: 16,),
                  if(inProgress)
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )

                   else
                  AppElevatedButton(
                      child: const Icon(Icons.arrow_circle_right_outlined),
                      onTap: () async {
                        inProgress =true;
                        setState(() {

                        });
                        final response = await NetworkUtils().getMethod(
                            Urls.recoverVerifyEmailUrl(
                              _emailETController.text.trim(),
                            ),
                        );
                        inProgress=false;
                        setState(() {

                        });

                     if(response !=null && response['status']=='success'){
                       if(mounted) {
                         showSnackBarMessage(
                             context, ' OTP sent to the email address');
                         Navigator.push(
                             context, MaterialPageRoute(
                             builder: (context)=>OTPVerificationScreen(email:_emailETController.text.trim())
                         )
                         );
                       }
                     } else{
                       if(mounted){
                         showSnackBarMessage(
                             context, ' OTP sent failed ! Try again',true);
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
    );
  }
}
