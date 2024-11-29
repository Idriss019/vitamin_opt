import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitamin_opt/data/db/tables/archiveTable.dart';
import 'package:vitamin_opt/navBar.dart';
import 'package:flutter/material.dart';
import 'package:vitamin_opt/providers/passwordProvider.dart';
import 'package:vitamin_opt/screens/other/archiveList.dart';
import 'package:vitamin_opt/screens/purchase/function.dart';

import '../../appBar.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  bool visibleErrorPassword = false;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final replyPasswordController = TextEditingController();
  double marginColumn = 7.0;

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    replyPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider = context.watch<PasswordProvider>();
    List errorPasswordList = [
      'Старый пароль не верный! Попробуйте еще раз!',
      'Повторно введенный пароль не соответствует с предыдущим'
    ];

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
              Visibility(
                visible: visibleErrorPassword,
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.red,
                  child: Center(child: Text(passwordProvider.errorPassword)),
                ),
              ),
              /* Прочее */
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Прочее',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              /* Кнопка Выгрузить базу */
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
                      "Выгрузить базу",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )),
              ),
              /* Кнопка Загрузить архив */
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: marginColumn),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: CustomColorButton(),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      // ArchiveBase.deleteAll(); // УДАЛИТЬ !!
                      SystemSound.play(SystemSoundType.click);
                      ArchiveBase.selectArchiveAll().then((listArchiveBase) {
                        // print('########');

                        print(listArchiveBase);
                        if (listArchiveBase.isEmpty) {
                          print('*******');
                          for (var el in archiveList) {
                            ArchiveBase.insertArchive(
                                barcode: el[0], product: el[1]);
                          }
                          print('!!!!!!!***');
                        } else {
                          /* Создание словаря */
                          Map<String, String> archiveDownloadBase = {};
                          for (var ar in listArchiveBase) {
                            archiveDownloadBase[ar.product] = ar.barcode;
                          }
                          /* Поиск по archiveList */
                          for (var el in archiveList) {
                            print('########');
                            print(el);
                            if (!archiveDownloadBase.containsValue(el[1]) &&
                                !archiveDownloadBase.containsKey(el[1])) {
                              print('%%%%%%');
                              if (el[0] != 'null' && el[0] != '0') {
                                print('>>>>>>>>');
                                ArchiveBase.insertArchive(
                                    barcode: el[0], product: el[1]);
                              } else {
                                print('else^^^^^^');
                                ArchiveBase.insertArchive(product: el[1]);
                              }
                            }
                            // print(listArchiveBase);
                            // if (el[0] != listArchiveBase[0].barcode &&
                            //     el[1] != listArchiveBase[1].product) {
                            //   print('${el[0]} =!= ${listArchiveBase[0].barcode}');
                            //   print('${el[1]} =*= ${listArchiveBase[1].barcode}');
                            //   // print(
                            //   //     '${el[0].runtimeType} == ${listArchiveBase[0].barcode.runtimeType}');
                            //   print('%%%%%%');
                            //   if (el[0] != 'null' && el[0] != '') {
                            //     ArchiveBase.insertArchive(
                            //         barcode: el[0], product: el[1]);
                            //   } else {
                            //     print('^^^^^^');
                            //     ArchiveBase.insertArchive(product: el[1]);
                            //   }
                            // }
                          }
                        }

                        print('------');
                        ArchiveBase.selectArchiveAll().then((el) {
                          print(el);
                        });
                      });

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Архив успешно загружен!'),
                            );
                          });
                    },
                    child: Text(
                      "Загрузить архив",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )),
              ),
              /* Изменить пароль */
              Container(
                margin: EdgeInsets.only(top: marginColumn + 20),
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Изменить пароль',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              /* Старый пароль */
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          ' Старый пароль',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: passwordController,
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
              /* Новый пароль */
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          ' Новый пароль',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: newPasswordController,
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
              /* Повторить пароль */
              Container(
                margin: EdgeInsets.only(top: marginColumn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          ' Повторить пароль',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: replyPasswordController,
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
              /* Кнопка сохранить пароль */
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: marginColumn + 5),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: CustomColorButton(),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      SystemSound.play(SystemSoundType.click);
                      if (passwordController.text !=
                          passwordProvider.password) {
                        // print('111111');
                        passwordProvider.errorPassword = errorPasswordList[0];
                        visibleErrorPassword = true;
                        setState(() {});
                      } else if (newPasswordController.text !=
                          replyPasswordController.text) {
                        // print('22222');
                        passwordProvider.errorPassword = errorPasswordList[1];
                        visibleErrorPassword = true;
                        setState(() {});
                      } else {
                        print('33333');
                        passwordProvider
                            .updatePassword(newPasswordController.text);
                        // print('********');
                        // print(passwordProvider.password);
                        passwordController.text = '';
                        newPasswordController.text = '';
                        replyPasswordController.text = '';
                        setState(() {});
                        passwordProvider.getPassword();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    'Пароль успешно изменен на - ${passwordProvider.password}'),
                              );
                            });
                      }
                    },
                    child: Text(
                      "Сохранить пароль",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
              ),
              /* Нал в витаминах */
              Container(
                margin: EdgeInsets.only(top: marginColumn + 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Text(
                          ' Нал в витаминах',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
