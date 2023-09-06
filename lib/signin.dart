import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {



  String email = '';
  String password = '';

  void saveUserState(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: TopAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
              color: kFontGoldColor,
              fontFamily: 'MPIDeco',
              fontSize: mediaQuery.size.width * 0.07,
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.9,
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 50.0,
              right: 50.0,
            ),
            child: TextField(
                style: const TextStyle(color: kFontGoldColor),
                keyboardType: TextInputType.emailAddress,
                cursorColor: kFontGoldColor,
                decoration: kTextInputDecoration.copyWith(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: kFontGoldColor,
                  ),
                ),
              onChanged: (value){
                  email = value;
              },
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.9,
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 50.0,
              right: 50.0,
            ),
            child: TextField(
                style: const TextStyle(color: kFontGoldColor),
                obscureText: true,
                cursorColor: kFontGoldColor,
                decoration: kTextInputDecoration.copyWith(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    IconData(0xf573,
                        fontFamily: CupertinoIcons.iconFont,
                        fontPackage: CupertinoIcons.iconFontPackage),
                  ),
                  prefixIconColor: kFontGoldColor,
                ),
              onChanged: (value){
                  password = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height *0.02),
            width: mediaQuery.size.width * 0.56,
            child: TextButton(
              onPressed: (){
                try{
                  Auth().logInWithEmailAndPassword(email: email, password: password);
                  saveUserState(email);
                  if(FirebaseAuth.instance.currentUser!=null){
                    if(email=='shubhtravels999@gmail.com'){
                      Navigator.pushNamed(context, 'admin');
                    }
                    else{
                      Navigator.pushNamed(context, 'homepage');
                    }
                  }
                } on FirebaseAuthException catch(e){
                  String text='Could not sign in';
                  if (e.code=='user-not-found'){
                    text='No user found for that email.';
                  }
                  else if(e.code=='wrong-password'){

                    text="Wrong password provided for that user.";
                  }
                  final snackBar = SnackBar(content: Text(text),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: mediaQuery.size.height * 0.027,
                  fontFamily: 'MPIDeco',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a registered user?',
                style: TextStyle(
                  color: kFontGoldColor,
                  fontSize: mediaQuery.size.width * 0.03,
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(kBackGroundMaroonColor),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signup');
                },
                child: Text(
                  'Click here to register now',
                  style: TextStyle(color: kFontGoldColor,fontSize: mediaQuery.size.width * 0.03,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
