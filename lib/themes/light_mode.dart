import 'package:flutter/material.dart';

class LightModeTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal,
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
          color: Colors.black87,
        ),
        bodySmall: TextStyle(fontSize: 16, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.teal,
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: IconThemeData(color: Colors.teal),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );
  }
}
