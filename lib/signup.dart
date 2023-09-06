import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'topappbar.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
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
            'Sign Up',
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
              onChanged: (value) {
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
                  hintText: 'Password (Atleast 6 characters)',
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
                String text='User registered successfully, please sign in';
                try{
                  Auth().signUpWithEmailAndPassword(email: email, password: password);
                  final snackBar = SnackBar(content: Text(text),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } on FirebaseAuthException catch(e){
                  if (e.code == 'weak-password'){
                    text='Password provided is too weak';
                  }
                  else if(e.code=='email-already-in-use'){
                    text="Email already registered, please sign in";
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
                'Sign Up',
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
                'Already a registered user?',
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
                  Navigator.pushReplacementNamed(context, 'signin');
                },
                child: Text(
                  'Click here to sign in',
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
