import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons in a row with equal spacing
            children: [
              InkWell(
                onTap: () {
                  // Handle button press
                },
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/1.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Button',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),],),),
              ),
              InkWell(
                onTap: () {
                  // Handle button press
                },
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/1.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Button',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),],),),
              ),
              InkWell(
                onTap: () {
                  // Handle button press
                },
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/1.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Button',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),],),),
              ),
            ],
          ),
        ),*/
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),

      ],
    ).p(0);
  }
}