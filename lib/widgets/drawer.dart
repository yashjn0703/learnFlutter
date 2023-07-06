import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://media.licdn.com/dms/image/D4D03AQGsbqZBCTsfkA/profile-displayphoto-shrink_400_400/0/1670831391356?e=1691625600&v=beta&t=-kvaEbWYO8i_9OIk2A_tyDfMioEAvEVjuLeDozbYeiI";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           DrawerHeader(
              padding: EdgeInsets.zero,
              child:
              Container(
                width: double.infinity,
                  child: Image.asset("assets/images/landscape.jpg",
                  fit: BoxFit.fill,),
              ),
           ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.home, color: Colors.white,),
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
              ),
              title: Text(
                  "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white
              ),),
              onTap: (){
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
              ),
              title: Text(
                "Log In",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
              onTap: (){
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white,),
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
              ),
              title: Text(
                "Cart",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
              onTap: (){
                Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
            ),

          ],
        ),
      )
    );

  }
}
