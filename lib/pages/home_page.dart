import 'package:flutter/material.dart';
import 'package:test_one/models/catalog.dart';
import 'package:test_one/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final int days = 77;
    final String name = "Yash";

    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App",
        ),
      ),
      body : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index){
              return  ItemWidget(
                item: dummyList[index],
              );
            }
        ),
      ),


      drawer: MyDrawer(),
    );
  }
}