import 'package:go_router/go_router.dart';
import 'package:vitamin_opt/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vitamin_opt/screens/purchase/function.dart';
import '../../appBar.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
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
                /* Закуп */
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Закуп',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                    children: [
                      /// Кол
                      Flexible(
                        flex: 1,
                        child: TextField(
                            // controller: _piecesController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                ),
                                labelText: ' Кол',
                                labelStyle: TextStyle(fontSize: 22))),
                      ),

                      /// Цена
                      Flexible(
                        flex: 2,
                        child: TextField(
                            // controller: _piecesController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                                labelText: '  Цена в сомах',
                                labelStyle: TextStyle(fontSize: 22))),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: marginColumn + 10),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: CustomColorButton(),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        SystemSound.play(SystemSoundType.click);
                      },
                      child: Text(
                        "Внести",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      )),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: marginColumn + 5),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: CustomColorButton2(),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        SystemSound.play(SystemSoundType.click);
                        context.go('/home/tables/tableStorage');
                      },
                      child: Text(
                        "⋘ перейти в склад ⋙",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
