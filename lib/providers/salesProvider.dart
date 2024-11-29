import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesProvider extends ChangeNotifier {
  String course = '123';


  SalesProvider() {
    getCourse();
  }

  /* Обновить курс */
  Future<void> updateCourse(password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('password', password);
  }

  /* Получить курс */
  Future<void> getCourse() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('course')) {
      course = preferences.getString('course') ?? '000';
      notifyListeners();
    }
  }
}