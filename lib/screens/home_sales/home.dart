import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitamin_opt/appBar.dart';
import 'package:vitamin_opt/navBar.dart';
import 'package:vitamin_opt/providers/salesProvider.dart';
import 'package:vitamin_opt/screens/purchase/function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseController = TextEditingController();
  double marginColumn = 7.0;
  double heightTable = 48 * 9;
  @override
  Widget build(BuildContext context) {
    final salesProvider = context.watch<SalesProvider>();
    courseController.text = salesProvider.course;
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
              /* Продажи */
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Продажи',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              /* Курс */
              Container(
                // width: double.infinity,
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          ' Курс',
                          style: TextStyle(fontSize: 28),
                        )),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: courseController,
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /* Штрих код */
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: TextField(
                  // controller: _barcodeController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    labelText: ' Штрих код',
                    labelStyle: TextStyle(fontSize: 24),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 38,
                      ), // calendar_view_week),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              /* Название */
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: TextField(
                  // controller: _nameController,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                      labelText: ' Название',
                      labelStyle: TextStyle(fontSize: 22)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: marginColumn + 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          ' Цена в сомах',
                          style: TextStyle(fontSize: 18),
                        )),
                    Flexible(
                      flex: 2,
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'всего',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: marginColumn + 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          ' Цена в рублях',
                          style: TextStyle(fontSize: 18),
                        )),
                    Flexible(
                      flex: 2,
                      child: TextField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabled: false,
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none
                              // BorderSide(color: Colors.black, width: 2.0),
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'кол.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(height: 5, thickness: 1.5, color: Colors.black),
                      Divider(height: 5, thickness: 1.5, color: Colors.black),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 8,
                        child: Text(
                          ' Сумма в рулях',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                        flex: 1,
                        child: Text(
                          '=',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 3,
                      child: TextField(
                        enabled: false,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /* Кнопка Добавить */
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
                    },
                    child: Text(
                      "Добавить",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )),
              ),
              /* Таблица корзины */
              Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(
                  //         10) // only(topLeft: Radius.circular(20)),
                  //     ),
                  height: heightTable,
                  margin: EdgeInsets.only(top: marginColumn + 10),
                  child: DataTable2(
                    headingRowColor: WidgetStateProperty.all(
                        Colors.blueAccent), //Colors.blueAccent,
                    minWidth: 700,
                    columnSpacing: 10,
                    headingRowHeight: 38,
                    dataRowHeight: 48,
                    border: TableBorder(
                      verticalInside:
                          BorderSide(color: Colors.black, width: 0.7),
                      // borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(20)),
                    ),
                    columns: [
                      DataColumn2(
                          label: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Удалить',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          fixedWidth: 60),
                      DataColumn2(
                          label: SizedBox(
                        width: double.infinity,
                        child: Text('Название',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                      DataColumn2(
                          label: SizedBox(
                              width: double.infinity,
                              child: Text('Цена в р.',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          fixedWidth: 90),
                      DataColumn2(
                          label: SizedBox(
                            width: double.infinity,
                            child: Text('Кол.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          fixedWidth: 60),
                      DataColumn2(
                          label: SizedBox(
                            width: double.infinity,
                            child: Text('Сумма',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          fixedWidth: 70),
                    ],
                    rows: [],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Divider(height: 5, thickness: 1.5, color: Colors.black),
                      Divider(height: 5, thickness: 1.5, color: Colors.black),
                      Divider(height: 5, thickness: 1.5, color: Colors.black),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 6,
                        child: Text(
                          ' Итого в рулях',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                        flex: 1,
                        child: Text(
                          '=',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 3,
                      child: TextField(
                        // enabled: false,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /* Кнопка Продать */
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
                    },
                    child: Text(
                      "Продать",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
