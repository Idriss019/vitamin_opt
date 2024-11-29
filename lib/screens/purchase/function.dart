
import 'package:flutter/material.dart';

/* Цвет главной кнопка нажатия */ 
class CustomColorButton extends WidgetStateColor {
  const CustomColorButton() : super(_defaultColor);

  static const int _defaultColor = 0x11111111;
  static const Color defaultColor = Colors.black;
  static const Color pressedColor = Colors.grey;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return pressedColor;
    }
    return defaultColor;
  }
}

/* Цвет2 кнопка нажатия */ 
class CustomColorButton2 extends WidgetStateColor {
  const CustomColorButton2() : super(_defaultColor);

  static const int _defaultColor = 0x11111111;
  static const Color defaultColor = Colors.white;
  static const Color pressedColor = Colors.grey;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return pressedColor;
    }
    return defaultColor;
  }
}