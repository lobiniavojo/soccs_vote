import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
  ).copyWith(
    secondary: Color(0xFF720082),
  ),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.grey.shade300,
  fontFamily: 'Roboto', // Set a custom font if you want
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF720082)),
    displayMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF720082)),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    titleMedium: TextStyle(color: Color(0xFF720082), fontWeight: FontWeight.bold),
    titleSmall: TextStyle(color: Colors.grey.shade600),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    labelStyle: TextStyle(color: Color(0xFF720082), fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF720082), // Use 'backgroundColor' instead of 'primary'
      foregroundColor: Colors.white, // Use 'foregroundColor' instead of 'onPrimary'
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF720082), // Use 'foregroundColor' instead of 'primary'
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Color(0xFF720082), // Use 'foregroundColor' instead of 'primary'
      side: BorderSide(color: Color(0xFF720082)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(Color(0xFF720082)),
  ),
);
