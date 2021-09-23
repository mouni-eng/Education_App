import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  accentColor: kPrimaryColor,
    iconTheme: IconThemeData(
      color: kPrimaryColor,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Color(0xFFEEFAFA),
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFEEFAFA),
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEEFAFA),
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          color: kPrimaryColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Jannah",
        ),
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFFEEFAFA),
      elevation: 30.0,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: kSecondaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: "Jannah",
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
        fontFamily: "Jannah",
      ),
      subtitle1: TextStyle(
        fontSize: 22.0,
        color: kSecondaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: "Jannah",
      ),
    ));

ThemeData darkTheme = ThemeData(
  accentColor: Colors.red,
  iconTheme: IconThemeData(
    color: Colors.red,
  ),
    cardTheme: CardTheme(
      color: Colors.black26,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF171821),
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF171821),
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF171821),
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Jannah",
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      backgroundColor: Color(0xFF171821),
      unselectedItemColor: Colors.grey,
      elevation: 30.0,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontFamily: "Jannah",
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontFamily: "Jannah",
      ),
    ));

const kPrimaryColor = Color(0xFF735FF2);

const kSecondaryColor = Colors.blueGrey;

String? uId = '';
