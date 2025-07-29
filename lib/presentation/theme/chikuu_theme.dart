import 'package:flutter/material.dart';

final ThemeData chikuuTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFFF6B9D),
    primary: Color(0xFFFF6B9D),
    secondary: Color(0xFF4ECDC4),
    background: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.redAccent,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontFamily: 'Poppins'),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF4ECDC4),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      backgroundColor: Color(0xFFFF6B9D),
      foregroundColor: Colors.white,
    ),
  ),
);