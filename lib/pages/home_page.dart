import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:test_one/models/catalog.dart';
import 'package:test_one/widgets/drawer.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


import '../widgets/item_widget.dart';
import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';




class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) =>
        Item.fromMap(item)).toList();
    setState(() {});
  }


  Widget build(BuildContext context) {
    final int days = 77;
    final String name = "Yash";


    return Scaffold(
      backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                      CircularProgressIndicator().centered().expand(),
                ],
              )

          ),
        )
    );
  }
}











