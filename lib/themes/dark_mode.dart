import 'package:flutter/material.dart';

class DarkModeTheme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: "Roboto",
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Color(0xFF23272F),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[800],
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
        buttonColor: Colors.grey[700],
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: CardThemeData(
        color: Colors.grey[800],
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[700],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.white,
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.grey[800]!,
        secondary: Colors.grey[600]!,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
      ),
    );
  }
}
