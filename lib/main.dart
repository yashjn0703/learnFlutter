import 'package:flutter/material.dart';
import 'package:test_one/pages/cart_page.dart';
import 'package:test_one/pages/home_page.dart';
import 'package:test_one/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_one/utils/routes.dart';
import 'package:test_one/widgets/themes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/" : (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
