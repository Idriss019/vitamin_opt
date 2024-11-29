import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordProvider extends ChangeNotifier {
  String password = '123';

  String errorPassword = '_';

  PasswordProvider() {
    getPassword();
  }
  // String oldPassword = '0';
  // String newPassword = '0';
  // String replyPassword = '0';

  // Future<SharedPreferences> preferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs;
  // }

  /* Обновить пароль */
  Future<void> updatePassword(password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('password', password);
  }

  /* Получить пароль */
  Future<void> getPassword() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('password')) {
      password = preferences.getString('password') ?? '000';
      notifyListeners();
    }
  }
}
