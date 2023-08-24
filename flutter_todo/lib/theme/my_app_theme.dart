import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryColor = const Color.fromARGB(
      255, 228, 220, 0); // Przykładowy główny kolor niebieski
  static Color accentColor =
      Color.fromARGB(255, 91, 182, 49); // Przykładowy kolor akcentu niebieski

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white, // Tło Scaffolda
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black), // Przykładowy tekst nagłówka
      bodyText1: TextStyle(
          fontSize: 16, color: Colors.black), // Przykładowy tekst główny
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor, // Kolor tła AppBar
      foregroundColor: Colors.white, // Kolor tekstu na AppBar
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: accentColor, // Kolor przycisków (kolor akcentu)
      textTheme: ButtonTextTheme.primary,
    ),
    // Inne ustawienia tematu
    // ...
  );
}
