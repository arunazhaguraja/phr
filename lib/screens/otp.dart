import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:untitled/screens/forgotpassword.dart';

import '../Components/Ktextformfield.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
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
                            "Enter OTP",
                            style: TextStyle(
                                fontSize: width / 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: height * 0.003),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              "Please enter the code sent to your registered mobile number/E-mail",
                              style: TextStyle(
                                //fontSize: width / 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 20),
                                    child: OtpTextField(
                                      numberOfFields: 4,
                                      //set to true to show as box or false to show as dash
                                      showFieldAsBox: true,
                                      //runs when a code is typed in
                                      onCodeChanged: (String code) {
                                        //handle validation or checks here
                                      },
                                      //runs when every textfield is filled
                                      onSubmit: (String
                                          verificationCode) {}, // end onSubmit
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        height: 54,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.04),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 10),
                                                  blurRadius: 50,
                                                  color: Colors.indigo
                                                      .withOpacity(0.23))
                                            ]),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Back to login? ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                TextSpan(
                                  text: 'Click here',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
