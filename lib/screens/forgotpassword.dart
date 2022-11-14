import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/Ktextformfield.dart';
import 'otp.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotPassword({Key? key}) : super(key: key);


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
                          child: GestureDetector(
                            onTap: () {
                              _formKey.currentState!.validate();
                                Navigator.of(context).push(MaterialPageRoute(builder: (c)=>OTP()));

                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                    "Get OTP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width / 25,
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
                            SizedBox(
                              height: height*0.05,
                            ),
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: width / 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: height * 0.003),
                            ),

                            Ktextformfield(

                              validator: (val) {
                                if (!val!.isValidEmail) return 'Enter valid email';
                              },

                              logo: Icons.email_outlined,
                              hinttext: "E-mail address",
                            ),
                            Ktextformfield(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              validator: (val) {
                                if (!val!.isValidPhone) return 'Enter valid phone';
                              },
                              logo: Icons.phone_android_outlined,
                              hinttext: "Mobile Number",
                            ),
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
                        text: "Haven't received the code? ",
                        style: TextStyle()),
                    TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(
                          color: Colors.blue[900], fontWeight: FontWeight.bold),
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
