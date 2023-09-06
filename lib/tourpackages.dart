import 'package:flutter/material.dart';
import 'package:shubhtoursandtravels/constants.dart';
import 'topappbar.dart';


class TourPackages extends StatelessWidget {
  const TourPackages({super.key});

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
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 30.0,),
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width * 0.9,
              child: TextField(
                cursorColor: kFontGoldColor,
                style: TextStyle(
                  color: kFontGoldColor,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kFontGoldColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kFontGoldColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Search by destinations',
                  hintStyle: TextStyle(
                    color: kFontGoldColor,
                  ),
                  icon: Icon(Icons.search),
                  iconColor: kFontGoldColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
