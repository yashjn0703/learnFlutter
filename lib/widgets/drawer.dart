import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Yash Jain"),
                  accountEmail: Text("yashjn0703@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  )
              ),),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text(
                  "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
          ],
        ),
      )
    );

  }
}
