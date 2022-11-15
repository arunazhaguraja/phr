import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/login.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final url;

  WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (await _controller.canGoBack()) {
              _controller.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: Stack(
            children: [
              WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
                navigationDelegate: (action) async{
                  if (action.url.contains('Home_Main')) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('username');
                    await prefs.remove('password');
                    await prefs.setBool('isLoggedIn', false);
                    // Won't redirect url
                    print('Trying to logout');
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => Login()));
                    return NavigationDecision.prevent;
                  }
                  else {
                    return NavigationDecision.navigate;
                  }
                },
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
