import 'package:flutter/material.dart';
import 'package:test_one/utils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
       child: Column(
         children: [
           Image.asset("assets/images/login.png",
             fit: BoxFit.cover,),
           SizedBox(
             height: 20,
           ),
           Text("Welcome $name",
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),),
           SizedBox(
             height: 20,
           ),
           Padding(
             padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
             child: Column(
               children: [
                 TextFormField(
                   decoration: InputDecoration(
                       hintText: "Enter Username",
                       labelText: "Username"
                   ),
                   onChanged: (value){
                     name = value;
                     setState(() {});
                   },
                 ),
                 TextFormField(
                   obscureText: true,
                   decoration: InputDecoration(
                       hintText: "Enter Password",
                       labelText: "Password"
                   ),
                 ),
                 SizedBox(
                   height: 40,
                 ),

                Container(
                  height: 50,
                  width: 150,
                  color: Colors.deepPurple,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                    fontSize: 18),
                  ),
                )

                /* ElevatedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, MyRoutes.homeRoute);
                   },
                   child: Text("Login"),
                   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                 ),*/
               ],
             ) ,
           ),
         ],
       ) ,
      ),

    );
  }
}
