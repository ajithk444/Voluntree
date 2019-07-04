import 'package:flutter/material.dart';

import 'ColorsManager.dart';

class AppTheme {
  static ThemeData getTheme() => ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
      brightness: Brightness.light,
      primarySwatch: MaterialColor(0xFF4fc3f7, {
        50:ColorsManager.lightBlue.withOpacity(0.1),
        100:ColorsManager.lightBlue.withOpacity(0.2),
        200:ColorsManager.lightBlue.withOpacity(0.3),
        300:ColorsManager.lightBlue.withOpacity(0.4),
        400:ColorsManager.lightBlue.withOpacity(0.5),
        500:ColorsManager.lightBlue.withOpacity(0.6),
        600:ColorsManager.lightBlue.withOpacity(0.7),
        700:ColorsManager.lightBlue.withOpacity(0.8),
        800:ColorsManager.lightBlue.withOpacity(0.9),
        900:ColorsManager.lightBlue,
      }),
      cursorColor: ColorsManager.lightBlue,
      backgroundColor: ColorsManager.backgroundGrey,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        buttonColor: ColorsManager.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        )
      ),
      textTheme: TextTheme(
        title: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
        body2: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        headline: TextStyle(fontSize: 24.0, color: ColorsManager.headlineTextColor, fontWeight: FontWeight.w400),
        body1: TextStyle(fontSize: 14.0, color: ColorsManager.bodyTextColor, fontWeight: FontWeight.w400)
      ),
      tabBarTheme: TabBarTheme(labelColor: ColorsManager.lightBlue),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          // actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: ColorsManager.lightBlue),
          textTheme:
          TextTheme(title: TextStyle(color: Colors.black, fontSize: 20))));
}
