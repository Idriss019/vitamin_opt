import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vitamin_opt/appBar.dart';
import 'package:vitamin_opt/navBar.dart';

class TableSales extends StatefulWidget {
  const TableSales({super.key});

  @override
  State<TableSales> createState() => _TableSalesState();
}

class _TableSalesState extends State<TableSales> {
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
                    /* Продажи */
                    Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Продажи',
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
                          minWidth: 1200,
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
                                      'Отменить',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                fixedWidth: 70),
                            DataColumn2(
                                label: SizedBox(
                                    width: double.infinity,
                                    child: Text('Дата',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                fixedWidth: 90),
                            DataColumn2(
                                label: SizedBox(
                                  width: double.infinity,
                                  child: Text('Сумма кор.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                fixedWidth: 90),
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
                                  child: Text('Кол.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                fixedWidth: 60),
                            DataColumn2(
                                label: SizedBox(
                                    width: double.infinity,
                                    child: Text('Цена в р.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                fixedWidth: 90),
                            DataColumn2(
                                label: SizedBox(
                                  width: double.infinity,
                                  child: Text('Сумма',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                fixedWidth: 70),
                            DataColumn2(
                                label: SizedBox(
                                    width: double.infinity,
                                    child: Text('Цена в сом',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                fixedWidth: 90),
                            DataColumn2(
                                label: SizedBox(
                                  width: double.infinity,
                                  child: Text('Курс',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                fixedWidth: 70),
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
