import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_one/core/store.dart';
import 'package:test_one/models/cart.dart';
import 'dart:convert';
import 'package:test_one/models/catalog.dart';
import 'package:test_one/utils/routes.dart';
import 'package:test_one/widgets/drawer.dart';
import 'package:test_one/widgets/nav_drawer.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



import '../widgets/item_widget.dart';
import 'home_detail_page.dart';
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Vx.indigo50,
       drawer: MyDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_outlined,
              ),
              color: MyTheme.darkBluishColor,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        //backgroundColor :MyTheme.mint,
        title: Image.asset("assets/images/welcome.png", width: 150,),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context,
                delegate: CustomSearch());
          },
              color: MyTheme.darkBluishColor,
              icon: Icon(CupertinoIcons.search))
        ],
        //Icon(CupertinoIcons.home, size: 30,),
        //"Home".text.color(MyTheme.darkBluishColor).bold.make(),
        //backgroundColor: MyTheme.creamColor,
      ),
        floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic _, VxStatus? __) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(CupertinoIcons.cart),
          ).badge(
              color: Colors.red ,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: MyTheme.creamColor,
                fontWeight: FontWeight.bold,
              )
          );
        }
      ),
     // backgroundColor: context.canvasColor,
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


class CustomSearch extends SearchDelegate{
  List<String> searchTerms = [
    "Iphone 12",
    "Banana"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      },
          icon: Icon(Icons.clear))
    ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruits in searchTerms){
      if (fruits.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruits);
      }
    }
    return ListView.builder(

      itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var result = matchQuery[index];
        final catalog = CatalogModel.items[index];
        if (result == CatalogModel.items[index].name){
          return ListTile(
            title: result.text.make(),
            leading: IconButton(
              icon: Icon(Icons.ads_click),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> HomePageDetail(catalog: catalog)
                )
                );
              },
            ),
          );
        }
       /* return ListTile(
          title: result.text.make(),
          leading: IconButton(
            icon: Icon(Icons.ads_click),
            onPressed: (){
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          ),
        );*/
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruits in searchTerms){
      if (fruits.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruits);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          final catalog = CatalogModel.items[1];
          return ListTile(
            title: result.text.make(),
            leading: IconButton(
              icon: Icon(Icons.ads_click),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> HomePageDetail(catalog: catalog)
                )
                );
              },
            ),
          );
        }
    );
  }

}








