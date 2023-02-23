import 'package:flutter/material.dart';

const kGridTextStyle = TextStyle(
  color: kTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 26,
);

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w300,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kAppBarColor,
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF1c734f),
      width: 2,
    ),
  ),
);

const formInputDecoration = InputDecoration(
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  labelStyle: TextStyle(
    color: kAppBarColor,
  ),
);

const kAppBarColor = Color(0xFF2cb67d);
const kTextColor = Color(0xFF1d2d44);
