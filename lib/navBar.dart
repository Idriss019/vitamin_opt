import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 8), () {
      // deleayed code here
      // print('delayed execution');
    });
    // if (Scaffold.of(context).isDrawerOpen) {
    //   Scaffold.of(context).closeDrawer();
    // }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
          // const UserAccountsDrawerHeader(
          //   accountName: Text(''),
          //   accountEmail: Text(
          //     '',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontStyle: FontStyle.italic,
          //         fontSize: 25),
          //   ),
          // currentAccountPicture: CircleAvatar(
          //   child: ClipOval(
          //     child:
          //     Icon(Icons.account_circle, size: 90),
          //     //  child: Image.asset(name,
          //     //  width: 90,
          //     //  height: 90,
          //     //  fit: BoxFit.cover,
          //   ),
          // ),
          //   decoration:
          //       BoxDecoration(color: const Color.fromARGB(255, 3, 119, 51)),
          // ),
          ListTile(
            leading: const Icon(Icons.balance), // arrow_circle_up
            title: const Text('Продажи'),
            onTap: () {
              // Scaffold.of(context).closeDrawer();
              // Navigator.pop(context, true);
              // context.pop();
              // ScaffoldMessenger.of(context).closeDrawer();
              context.pop();
              context.go('/home');
              // if (Scaffold.of(context).isDrawerOpen) {
              //   Scaffold.of(context).closeDrawer();
              // }

              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Закупки'),
            onTap: () {
              context.pop();
              context.go('/home/purchases');
            },
          ),
          ListTile(
            leading: const Icon(Icons.apps_sharp),
            title: const Text('Таблицы'),
            onTap: () {
              context.pop();
              context.go('/home/tables');
            },
          ),
          ListTile(
            leading: const Icon(Icons.amp_stories_outlined),
            title: const Text('Прочее'),
            onTap: () {
              context.pop();
              context.go('/home/other');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Выход'),
            onTap: () {
              context.pop();
              // Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
