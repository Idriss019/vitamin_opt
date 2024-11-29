import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vitamin_opt/appBar.dart';
import 'package:vitamin_opt/data/db/database.dart';
import 'package:vitamin_opt/data/db/tables/archiveTable.dart';
import 'package:vitamin_opt/navBar.dart';
import 'package:string_capitalize/string_capitalize.dart';

class TableArchive extends StatefulWidget {
  const TableArchive({super.key});

  @override
  State<TableArchive> createState() => _TableArchiveState();
}

class _TableArchiveState extends State<TableArchive> {
  bool visibleHeader = true;
  double marginColumn = 7.0;
  // List<int> marginOfOriente = [168, 0];
  // int marginHorizontal = 0;
  // int marginVertical = 168;
  int marginOriente = 168;
  double marginContainer = 17.0;
  Future<List<ArchiveTableData>> archiveBase = ArchiveBase.getAll();
  var isAscending = true;
  var sortColumnIndex = 0;

  /* Функция для создание строк */
  Future<List<DataRow>> _createRows() async {
    List<DataRow> dataR = [];

    for (var i in await archiveBase) {
      final controllerBarcode = TextEditingController();
      final controllerProduct = TextEditingController();
      controllerBarcode.text = i.barcode ?? 'null';
      controllerProduct.text = i.product;
      List<DataCell> dataC = [
        /// Удалить
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text(
                          'Уверены что хотите удалить - \n${i.product.capitalizeEach()} ?'),
                      actions: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  кнопка принятия */
                              TextButton(
                                onPressed: () {
                                  ArchiveBase.deleteById(i.id);
                                  setState(() {
                                    archiveBase = ArchiveBase.getAll();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                              /* кнопка отмены */
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                            ])
                      ]);
                });
            // ArchiveBase.deleteById(i.id);
            // setState(() {
            //   archiveBase = ArchiveBase.getAll();
            // });
          },
        )),

        /// Id
        DataCell(Text(i.id.toString())),

        /// Штрих-код
        DataCell(SizedBox(
            width: double.infinity,
            child: TextField(
              controller: controllerBarcode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                // print('${i.id}:: ${controller.text}');
                ArchiveBase.updateByIdBar(
                    id: i.id, barcode: controllerBarcode.text);
                setState(() {
                  archiveBase = ArchiveBase.getAll();
                  // print('set!!!');
                });
              },
            )
            // Text(
            //   i.barcode ?? '',
            //   textAlign: TextAlign.center,
            // ),
            )),

        /// Название
        DataCell(TextField(
          controller: controllerProduct,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            ArchiveBase.updateByIdPr(id: i.id, product: controllerProduct.text);
            setState(() {
              archiveBase = ArchiveBase.getAll();
            });
          },
        )),

        /// Цена
        DataCell(Text('00'))
      ];
      dataR.add(DataRow(cells: dataC));
      // List<DataCell> dataC = [];
      // dataC.add(DataCell(IconButton(
      //   icon: Icon(Icons.delete),
      //   onPressed: () {
      //     ArchiveBase.deleteById(i.id);
      //     setState(() {
      //       archiveBase = ArchiveBase.getAll();
      //     });
      //   },
      // )));
      // dataC.add(DataCell(Text(i.id.toString())));
      // dataC.add(DataCell(SizedBox(
      //   width: double.infinity,
      //   child: Text(
      //     i.barcode ?? '',
      //     textAlign: TextAlign.center,
      //   ),
      // )));
      // dataC.add(DataCell(Text(i.product.capitalizeEach())));
      // dataC.add(DataCell(Text('00')));
      // DataRow dat = DataRow(cells: dataC);
      // dataR.add(dat);
    }
    return dataR;
  }

  @override
  Widget build(BuildContext context) {
    void getOpacityForOrientation() {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        visibleHeader = false;
        marginOriente = 102;
        marginContainer = 0.0;
      } else {
        visibleHeader = true;
        marginOriente = 168;
        marginContainer = 17.0;
      }
    }

    getOpacityForOrientation();
    final screenHeight = MediaQuery.of(context).size.height - marginOriente;
    return Scaffold(
        drawer: Navbar(),
        appBar: CustomAppBar(),
        body: SafeArea(
            /* Wrapper */
            child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Visibility(
                    visible: visibleHeader,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Архив',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  /* Таблица архив */
                  FutureBuilder(
                    future: _createRows(),
                    builder: (context, snapshot) {
                      final List<DataRow> datRow = snapshot.data ?? <DataRow>[];
                      return Container(
                          height: screenHeight, //----- высота
                          margin: EdgeInsets.only(top: marginContainer),
                          child: DataTable2(
                              sortAscending: isAscending,
                              sortColumnIndex: sortColumnIndex,
                              headingRowColor: WidgetStateProperty.all(
                                  Colors.blueAccent), //Colors.blueAccent,
                              minWidth: 750,
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
                                        child: Text(
                                          'Id',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    fixedWidth: 50),
                                DataColumn2(
                                    label: SizedBox(
                                        width: double.infinity,
                                        child: Text('Штрих-код',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    fixedWidth: 140),
                                DataColumn2(
                                    onSort: (columnIndex, ascending) {
                                      setState(() {
                                        print('columnIndex-------$columnIndex');
                                        print('ascending-------$ascending');
                                        sortColumnIndex = columnIndex;
                                        isAscending = ascending;
                                      });
                                    },
                                    label: SizedBox(
                                      width: double.infinity,
                                      child: Text('Название',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    )),
                                DataColumn2(
                                    label: SizedBox(
                                      width: double.infinity,
                                      child: Text('Цена в сом',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    fixedWidth: 80),
                              ],
                              rows: datRow

                              //     [
                              //   DataRow(cells: [
                              //     DataCell(Text('-')),
                              //     DataCell(Text('1212')),
                              //     DataCell(Text('qwqw')),
                              //     DataCell(Text('11'))
                              //   ]),
                              //   DataRow(cells: [
                              //     DataCell(Text('-')),
                              //     DataCell(Text('1212')),
                              //     DataCell(Text('qwqw')),
                              //     DataCell(Text('11'))
                              //   ]),
                              //   DataRow(cells: [
                              //     DataCell(Text('-')),
                              //     DataCell(Text('1212')),
                              //     DataCell(Text('qwqw')),
                              //     DataCell(Text('11'))
                              //   ]),
                              // ]

                              ));
                    },
                  ),
                ],
              )),
        )));
  }
}
