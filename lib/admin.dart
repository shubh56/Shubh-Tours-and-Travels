import 'package:flutter/material.dart';
import 'constants.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Future<bool> adminLogOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('email');
    return true;
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'Shubh Tours & Travels',
          style: TextStyle(
            color: kFontGoldColor,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width*0.07,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(kBackGroundMaroonColor),
                  shadowColor: MaterialStatePropertyAll(kFontGoldColor),
                  elevation: MaterialStatePropertyAll(30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'custTourReq');
                },
                child: Text(
                  'Tour Packages',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(kBackGroundMaroonColor),
                  shadowColor: MaterialStatePropertyAll(kFontGoldColor),
                  elevation: MaterialStatePropertyAll(30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'reqHotel');
                },
                child: Text(
                  'Hotels',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(kBackGroundMaroonColor),
                  shadowColor: MaterialStatePropertyAll(kFontGoldColor),
                  elevation: MaterialStatePropertyAll(30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'reqAir');
                },
                child: Text(
                  'Air Tickets',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                  elevation: MaterialStatePropertyAll(30.0),
                ),
                onPressed: ()  {
                  Auth().signOut();
                  adminLogOut().then((value){
                    if(value==true){
                      Navigator.pushReplacementNamed(context, 'signin');
                    }
                  });
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: Colors.white,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}