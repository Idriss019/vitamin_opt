import 'package:flutter/material.dart';

AppBar CustomAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 3, 119, 51),
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      title: Container(
          padding: EdgeInsets.only(right: 30),
          width: double.infinity,
          // color: Colors.blue,
          child: const Text(
            'Vitamin opt',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 32),
          )),
    );
  }