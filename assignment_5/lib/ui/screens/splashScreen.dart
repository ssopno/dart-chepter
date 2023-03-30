
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/data/auth_utils.dart';
import 'package:untitled/ui/screens/login.dart';
import 'package:untitled/ui/screens/main_bottom_nav_ber.dart';
import 'package:untitled/ui/widget/screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 2)).then((value) {
      checkUserAuthState();
    });

  }

      Future<void> checkUserAuthState() async {
        final bool result = await AuthUtils.checkLoginState();
        if (result){
          await AuthUtils.getAuthData();
          if(mounted){
         Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context)=>const MainBottomNavBar()),
           (route) => false);
           }
        }else{
          if(mounted){
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context)=>const LoginScreen()),
                  (route) => false);

        }
        }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 160,
            fit: BoxFit.scaleDown,
          ),
        ) ,
      ),
    );
  }
}
