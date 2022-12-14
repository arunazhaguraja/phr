import 'package:flutter/material.dart';
import 'package:untitled/screens/forgotpassword.dart';
import 'package:untitled/screens/login.dart';
import 'package:untitled/screens/otp.dart';
import 'package:untitled/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPageLoading(),
    );
  }
}
