import 'package:flutter/material.dart';

mixin AppTheme {
  static final defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.4,
            color: Colors.black,
          ),
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          displayMedium: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          displaySmall: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          headlineLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          labelLarge: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[600],
    ),
    cardTheme: CardTheme(
      shadowColor: Colors.grey[200],
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 6.0,
    ),
    buttonTheme: const ButtonThemeData(
      height: 56,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
