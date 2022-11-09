import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Login",style: TextStyle(fontSize:width/9 ),),
          Text("Please sign in to continue",style: TextStyle(fontSize:width/15),),
          TextFormField(),
          TextFormField(),
          TextButton(onPressed: (){}, child: Text("login"),)



        ],
      ),
    );
  }
}
