import 'package:flutter/material.dart';
import 'package:foomato/core/store.dart';
import 'package:foomato/pages/cart_page.dart';
import 'package:foomato/pages/login_page.dart';
import 'package:foomato/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'widgets/themes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeManager>(
        create: (_) => ThemeManager(),
      ),
    ],
    child: VxState(store: MyStore(), child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (_, manager, __) {
          return MaterialApp(

            theme: manager.themeData,
            // darkTheme: MyTheme.darkTheme(context),
            debugShowCheckedModeBanner: false,
            initialRoute: MyRoutes.loginRoute,
            routes: {
              "/": (context) => LoginPage(),
              MyRoutes.homeRoute: (context) => HomePage(),
              MyRoutes.loginRoute: (context) => LoginPage(),
              MyRoutes.cartRoute: (context) => CartPage(),
              MyRoutes.themeRoute: (context) => RootPage(),
            },
          );
        },
      ),
    );
  }
}
