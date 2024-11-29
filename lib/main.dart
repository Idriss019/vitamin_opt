// import 'package:bionica_vita/data/db/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitamin_opt/providers/passwordProvider.dart';
import 'package:vitamin_opt/providers/salesProvider.dart';
import 'package:vitamin_opt/screens/start/start.dart';
import 'package:vitamin_opt/screens/tableArchive/tableArchive.dart';
import 'package:vitamin_opt/screens/tableSales/tableSales.dart';
import 'package:vitamin_opt/screens/tableStorage/tableStorage.dart';
import 'screens/home_sales/home.dart';
import 'package:go_router/go_router.dart';

import 'screens/other/other.dart';
import 'screens/purchase/purchases.dart';
import 'screens/tables/tables.dart';

// late AppDb mdb;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final mdb = AppDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (context) => SalesProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(disabledColor: Colors.black),
        debugShowCheckedModeBanner: false,
        // home: const HomeScreen(),
        routerConfig: _router,
      ),
    );
  }
}

// GoRouter configuration
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    // transitionDuration: const Duration(milliseconds: 3000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: StartScreen(),
    ),
    routes: [
      GoRoute(
          path: 'home',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: HomeScreen(),
              ),
          routes: [
            GoRoute(
              path: 'purchases',
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: PurchasesScreen(),
              ),
            ),
            GoRoute(
              path: 'tables',
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: TablesScreen(),
              ),
              routes:[
                GoRoute(
                  path: 'tableStorage',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: TableStorage(),
                  ),
                ),
                GoRoute(
                  path: 'tableSales',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: TableSales(),
                  ),
                ),
                GoRoute(
                  path: 'tableArchive',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: TableArchive(),
                  ),
                ),
              ]
            ),
            GoRoute(
              path: 'other',
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: OtherScreen(),
              ),
            ),
          ]),
    ],
  ),
]);
