import 'package:flutter/material.dart';

class DarkTheme {

final _lightColor = _LightColor();

  late ThemeData theme;

  DarkTheme (){
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(4))),
        color: Color.fromARGB(255, 0, 0, 0)),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(onPrimary: Colors.purpleAccent, onSecondary: _lightColor.blueMana)),
      colorScheme: const ColorScheme.light(),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(Colors.green),
        side: const BorderSide(color: Color.fromARGB(255, 9, 29, 9))
      ),
    textTheme: ThemeData.light().textTheme.copyWith(
      titleLarge:  TextStyle(
        fontSize: 20,
        color: _lightColor._textColor
      ) 
     )
    ) ;
   } 
  }
 
class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 29, 22, 53);
  final Color blueMana = const Color.fromARGB(95, 10, 30, 79);
}