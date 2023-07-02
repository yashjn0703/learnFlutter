import 'package:flutter/material.dart';
import 'package:test_one/models/cart.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Rs.${_cart.totalPrice}".text.xl5.color(MyTheme.darkBluishColor).make(),
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
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
      ? "Your Cart is empty".text.xl2.make()
      : ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: (context, index) =>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              _cart.remove(_cart.items[index]);
              //setState(() {});
            },
          ),
          title: _cart.items[index].name.text.make(),
        )
    );
  }
}


