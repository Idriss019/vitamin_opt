import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vitamin_opt/appBar.dart';
import 'package:vitamin_opt/navBar.dart';

class TableStorage extends StatefulWidget {
  const TableStorage({super.key});

  @override
  State<TableStorage> createState() => _TableStorageState();
}

class _TableStorageState extends State<TableStorage> {
  double marginColumn = 7.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbar(),
        appBar: CustomAppBar(),
        body: SafeArea(
            /* Wrapper */
            child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    /* Склад */
                    Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Склад',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    /* Таблица архив */
                    Container(
                        height: 500, //----- поменять
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                fixedWidth: 60),
                            DataColumn2(
                                label: SizedBox(
                              width: double.infinity,
                              child: Text('Название',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                            DataColumn2(
                                label: SizedBox(
                                  width: double.infinity,
                                  child: Text('кол.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                fixedWidth: 80),
                            DataColumn2(
                                label: SizedBox(
                                    width: double.infinity,
                                    child: Text('Штрих-код',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                fixedWidth: 120),
                          ],
                          rows: [],
                        )),
                  ],
                ))));
  }
}
