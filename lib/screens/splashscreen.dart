import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/API/api_helper.dart';
import 'package:untitled/screens/login.dart';
import 'package:untitled/screens/webview.dart';


class SplashPageLoading extends StatefulWidget {
  @override
  _SplashPageLoadingState createState() => _SplashPageLoadingState();
}

class _SplashPageLoadingState extends State<SplashPageLoading> {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  bool _doLogin = false;

  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 3), () => checkUserIsLogged());
  }

  void checkUserIsLogged() async {
    final prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool('isLoggedIn') == true)) {
      print("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${prefs.getStringList('whenloggedin')![0]}");

      var nowloggedin = DateTime.now();

      print("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${nowloggedin.year}");

      var from = DateTime(int.parse(prefs.getStringList('whenloggedin')![0]), int.parse(prefs.getStringList('whenloggedin')![1]), int.parse(prefs.getStringList('whenloggedin')![2]));
      var to = DateTime(nowloggedin.year, nowloggedin.month, nowloggedin.day);

      var numberofdaysloggedin=(to.difference(from).inHours / 24).round();
      print("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${numberofdaysloggedin}");


      setState(() {
        if(numberofdaysloggedin>=30)
          {
            _doLogin = false;

          }
        else{
          _doLogin = true;

        }
      });
      apiBaseHelper.get(
          'Login/AppLoginAPI?Username=${prefs.getString('username')}&Password=${prefs.getString('password')}').then((response) {
        if (response != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => WebViewPage(url: response["RedirectURL"])));
        }
      }).catchError((error) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Login()));
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Login())));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.indigo,
            gradient: LinearGradient(
                colors: [
                  Color(0xFF3d9deb),
                  Color(0xFF012261),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(2.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),),
        child: Center(
          child:
          _doLogin ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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

            ],
          ):
          Column(
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

            ],
          ),
        ),
      ),
    );
  }
}