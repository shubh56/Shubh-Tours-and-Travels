import 'package:flutter/material.dart';

const kBackGroundMaroonColor = Color(0xff2e0b0c);
const kFontGoldColor = Color(0xffcbb26a);

const kTextInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: kFontGoldColor,
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFontGoldColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFontGoldColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
