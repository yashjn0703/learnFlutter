import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/models/cart.dart';
import 'package:test_one/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import '../home_page.dart';
import 'addToCart.dart';
import 'catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.items[index];
          if(CatalogModel.items[index].category == 1){
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> HomePageDetail(catalog: catalog)
              )
              ),
              child: CatalogItem(catalog: catalog),
            ) ;
          }
        }
    ): ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.items[index];
          if(CatalogModel.items[index].category == 1){
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> HomePageDetail(catalog: catalog)
              )
              ),
              child: CatalogItem(catalog: catalog),
            ) ;
          }
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(tag: Key(catalog.id.toString()), child: CatalogImage(image: catalog.image)),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddtoCart(catalog: catalog),
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(context.isMobile?0:16)
      )
    ];
    return VxBox(
        child: context.isMobile? Row(
          children: children2,
        ): Column(
          children: children2,
        )
    ).white.rounded.square(150).make().py16();
  }
}


