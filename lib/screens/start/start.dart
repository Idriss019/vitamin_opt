import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vitamin_opt/providers/passwordProvider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool visibleErrorPassword = false;
  String password = '123';
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passwordProvider = context.read<PasswordProvider>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          /* Vitamin opt */
          Container(
            color: Colors.greenAccent,
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Vitamin opt',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Visibility(
            visible: visibleErrorPassword,
            child: Container(
              width: double.infinity,
              height: 20,
              color: Colors.red,
              child:
                  Center(child: Text('Пароль не верный! Попробуйте еще раз!')),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          /* Введите пароль */
          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Введите пароль',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 55,
            child: TextField(
              autofocus: true,
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(fontSize: 32),
              keyboardType: TextInputType.number,
              onChanged: (controller) {
                passwordProvider.getPassword();
                print('++++++++');
                print(passwordProvider.password);
                if (controller == passwordProvider.password) {
                  context.go('/home');
                }
              },
              // onSubmitted: (controller) {
              //   // print(controller);
              //   if (controller == password) {
              //     context.go('/home');
              //   } else {
              //     setState(() {
              //       visibleErrorPassword = true;
              //       _passwordController.text = '';
              //     });
              //   }
              // },
            ),
          )
        ],
      ),
    ));
  }
}
