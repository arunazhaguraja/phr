import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Login",style: TextStyle(fontSize:width/12,fontWeight: FontWeight.bold),),
          Text("Please sign in to continue.",style: TextStyle(fontSize:width/20,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),

                  hintStyle: TextStyle(color: Colors.grey,fontFamily: "WorkSansLight"),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Username'),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),

                  hintStyle: TextStyle(color: Colors.grey,fontFamily: "WorkSansLight"),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password'),
            ),
          ),


          TextButton(onPressed: (){}, child: Text("Forget Password",style: TextStyle(color: Colors.white),),)



        ],
      ),
    );
  }
}
