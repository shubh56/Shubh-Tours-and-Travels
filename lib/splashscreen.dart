import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String email;
  void getUserState() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     email = prefs.get("email")!=null?prefs.get("email").toString():"null";
  }

  @override
  void initState(){
    getUserState();
    Timer(const Duration(seconds: 5), () {
      if(email!="null"){
        if(email=='shubhtravels999@gmail.com'){
          Navigator.pushReplacementNamed(context, 'admin');
        }
        else {
          Navigator.pushReplacementNamed(context, 'homepage');
        }
      }
      else{
        Navigator.pushReplacementNamed(context, 'signup');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      body: Center(
        child: AnimatedTextKit(
          isRepeatingAnimation: true,
          totalRepeatCount: 4,
          animatedTexts: [
            TypewriterAnimatedText(
                'Shubh Tours and Travels',
                textStyle: TextStyle(
                  fontFamily: 'Northwell',
                  fontSize: mediaQuery.size.height * 0.07,
                  color: kFontGoldColor,
                ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
