import 'package:flutter/material.dart';
import 'package:test_one/models/cart.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),

    );
  }
}


class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [VxConsumer(
            notifications: {},
            builder:(context, dynamic _, VxStatus? __) {
            return "Rs.${_cart.totalPrice}"
                .text
                .xl5
                .color(MyTheme.darkBluishColor)
                .make();
        },
            mutations:{RemoveMutation},),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported yet!".text.make()));
            },
              child: "Buy".text.white.make(),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
      ? "Your Cart is empty".text.xl2.make()
      : ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: (context, index) =>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () => RemoveMutation(_cart.items[index]),
              //setState(() {});

          ),
          title: _cart.items[index].name.text.make(),
        )
    );
  }
}


