import 'package:flutter/material.dart';
import 'package:test_one/models/catalog.dart';
import 'package:test_one/pages/home_widgets/addToCart.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetail extends StatelessWidget {
  final Item catalog ;
  const HomePageDetail({Key? key, required this.catalog})
      :assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.purple700.make(),
            AddtoCart(catalog: catalog,).wh(120, 50)
          ],
        ).p32(),
      ),

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)).h32(context),
            Expanded(child: VxArc(
            height: 30,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.lg.xl4.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "hjghjdhhfyusj jhhjadsb lorem ipsum waah waah waah sjfhjsdahjhaskjhhdas asdhasdjhusa sjdagh asoijlkad un"
                      .text.textStyle(context.captionStyle).make().p16()
                ],
              ).py64(),
            ),
            )
            )
          ],
        ),
      )

    );
  }
}
