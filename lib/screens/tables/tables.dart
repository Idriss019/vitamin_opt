import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vitamin_opt/navBar.dart';
import 'package:flutter/material.dart';
import 'package:vitamin_opt/screens/purchase/function.dart';

import '../../appBar.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  double marginColumn = 7.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: CustomAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              /* Wrapper */
              child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            /* Таблицы */
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Таблицы',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            /* Кнопка Склад */
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: marginColumn),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: CustomColorButton(),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    SystemSound.play(SystemSoundType.click);
                    context.go('/home/tables/tableStorage');
                  },
                  child: Text(
                    "Склад",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )),
            ),
            /* Кнопка Продажи */
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: marginColumn),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: CustomColorButton(),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    SystemSound.play(SystemSoundType.click);
                    context.go('/home/tables/tableSales');
                  },
                  child: Text(
                    "Продажи",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )),
            ),
            /* Кнопка Архив */
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: marginColumn),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: CustomColorButton(),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    SystemSound.play(SystemSoundType.click);
                    context.go('/home/tables/tableArchive');
                  },
                  child: Text(
                    "Архив",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )),
            ),
          ],
        ),
      ))),
    );
  }
}
