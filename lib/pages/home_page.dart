import 'package:flutter/material.dart';
import 'package:test_one/widgets/drawer.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final int days = 77;
    final String name = "Yash";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body : Center(
          child: Container(
            child: Text("Welcome to $days life transformation by $name"),
          )),

      drawer: MyDrawer(),
    );
  }
}