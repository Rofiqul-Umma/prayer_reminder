import 'package:flutter/material.dart';

class DarkModeTheme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: "Roboto",
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: TextStyle(fontSize: 16, color: Colors.grey[400]),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[500]),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey[800],
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: CardTheme(
        color: Colors.grey[850],
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
    );
  }
}
