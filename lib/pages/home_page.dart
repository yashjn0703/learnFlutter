import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:test_one/models/catalog.dart';
import 'package:test_one/widgets/drawer.dart';

import '../widgets/item_widget.dart';

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
  
  loadData()async{
    await Future.delayed(Duration(seconds: 2));

    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items  = List.from(productData).map<Item>((item) =>
          Item.fromMap(item)).toList();
    setState(() {});
  }


  Widget build(BuildContext context) {

    final int days = 77;
    final String name = "Yash";



    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App",
        ),
      ),
      body : Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  GridTile(
                    header: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(item.name,
                      style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                    ) ,
                    child: Image.network(item.image),
                    footer: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(item.price.toString(),
                        style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ) ,
                ) ,
              );

            },
          itemCount: CatalogModel.items.length,
        )
            :Center(
          child: CircularProgressIndicator(),
        ),
      ),


      drawer: MyDrawer(),
    );
  }
}