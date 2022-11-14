import 'package:flutter/material.dart';
import 'package:untitled/API/api_helper.dart';
import 'package:untitled/screens/forgotpassword.dart';

import '../Components/Ktextformfield.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  ApiBaseHelper apiBaseHelper =ApiBaseHelper();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

            children: [
              Container(
                  height: height * 0.8,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.8 - 27,
                        decoration: const BoxDecoration(
                            color: Colors.indigo,
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF3d9deb),
                                  const Color(0xFF012261),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(2.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                              bottomRight: Radius.circular(36),
                            )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              print("formmmmmmmmmmmmmm${_formKey.currentState.toString()}");
                              _formKey.currentState!.validate();

                             //print("XXXXXXXXXXXXXXXXXXXXX${apiBaseHelper.get('')}");

                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width / 20,
                                    fontWeight: FontWeight.bold),
                              )),
                              height: 54,
                              margin:
                                  EdgeInsets.symmetric(horizontal: width * 0.1),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Colors.indigo.withOpacity(0.23))
                                  ]),
                            ),
                          )),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.15,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/1.png"),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/2.png"),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/3.png"),
                                  )),
                                ],
                              ),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: width / 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: height * 0.003),
                            ),
                            Text(
                              "Please sign in to continue.",
                              style: TextStyle(
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: height * 0.003),
                            ),
                            Ktextformfield(
                              validator: (val) {
                                print("valllllllllllllllllllllll$val");
                                if (val.toString().isEmpty) return 'Enter valid Username';
                              },
                              logo: Icons.person,
                              hinttext: "Username",
                            ),
                            Ktextformfield(
                              validator: (val) {

                                if () return 'Enter valid password';
                              },
                              logo: Icons.key_rounded,
                              hinttext: "Password",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width / 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>ForgotPassword()));
                                  },
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 15,
                                  child: Builder(builder: (context) {
                                    return CircleAvatar(
                                        radius: 13,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.question_mark_rounded,
                                            color: Colors.red));
                                  }),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Do you need help? ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Click here',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
