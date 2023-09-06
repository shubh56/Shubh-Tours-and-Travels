import 'package:flutter/material.dart';
import 'constants.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AppBar(
      iconTheme: const IconThemeData(color: kFontGoldColor),
      backgroundColor: kBackGroundMaroonColor,
      title: Container(
        margin: const EdgeInsets.only(top: 22.0),
        child: Text(
          'Shubh Tours and Travels',
          style: TextStyle(
            fontSize: mediaQuery.size.width * 0.07,
            fontFamily: 'Northwell',
            color: kFontGoldColor,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}