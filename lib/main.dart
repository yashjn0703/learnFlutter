import 'package:flutter/material.dart';
import 'package:test_one/pages/home_page.dart';
import 'package:test_one/pages/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => HomePage(),
      },
    );
  }
}
