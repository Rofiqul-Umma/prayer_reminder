import 'package:flutter/material.dart';

class LightModeTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey[900], // dark grey
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900], // dark grey
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
          color: Colors.grey[900], // dark grey
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
        ), // medium grey
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ), // lighter grey
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey[900], // dark grey
        textTheme: ButtonTextTheme.primary,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.all(Colors.grey[400]), // light grey
      ),
      cardTheme: CardTheme(
        color: Colors.grey[50], // very light grey
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100], // light grey
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: IconThemeData(color: Colors.grey[900]), // dark grey
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[900], // dark grey
        foregroundColor: Colors.white,
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.grey[900]!,
        secondary: Colors.grey[800]!,
        surface: Colors.white,
        // surface: Colors.grey[50]!, // Optionally remove or adjust this line if you want a different surface color
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.grey[900]!,
      ),
    );
  }
}
