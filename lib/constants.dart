import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Color(0xFFEEFAFA),
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFEEFAFA),
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEEFAFA),
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Jannah",
        ),
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
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
    cardTheme: CardTheme(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF171821),
    primarySwatch: Colors.green,
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
      selectedItemColor: Color(0xFFE21938),
      backgroundColor: Color(0xFF171821),
      unselectedItemColor: Colors.grey,
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
    ));

const kPrimaryColor = Color(0xFF24C6B9);
const kSecondaryColor = Colors.blueGrey;

String? uId = '';
