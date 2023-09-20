import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThreeOptions extends StatefulWidget {
  const ThreeOptions({super.key});

  @override
  State<ThreeOptions> createState() => _ThreeOptionsState();
}

class _ThreeOptionsState extends State<ThreeOptions> {
  bool loggedIn = false;
  void getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("email") == null) {
      loggedIn = true;
      showAlertDialog();
    }
  }

  void showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Please sign in'),
            content: Text('You are required to sign in to continue'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'signin');
                },
                child: Text('Sign in'),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    getCurrentUser();
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
                  Navigator.pushNamed(context, 'tourpacks');
                },
                child: Hero(
                  tag: 'tourHero',
                  child: Material(
                    color: kBackGroundMaroonColor,
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
                  Navigator.pushNamed(context, 'hotels');
                },
                child: Hero(
                  tag: 'hotelHero',
                  child: Material(
                    color: kBackGroundMaroonColor,
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
                  Navigator.pushNamed(context, 'airtickets');
                },
                child: Hero(
                  tag: 'airHero',
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
            ),
          ],
        ),
      ),
    );
  }
}
