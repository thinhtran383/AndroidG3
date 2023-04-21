import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../home/home.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Example',
      home: MyWebView(),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {  
  final _controller = Completer<WebViewController>();
  String result = '';

  Future<String> _showConsole() async {
  final controller = await _controller.future;
  final result = await controller.evaluateJavascript('Init_Prammater()');
  final json = jsonDecode(result);
  final userId = json['userId'];
  print('userId: $userId');
  return userId;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: WebView(
        initialUrl: 'https://qldtbeta.phenikaa-uni.edu.vn/congsinhvien/login.aspx',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => _controller.complete(controller),
        onPageFinished: (url) async {
          if (url.contains('/index.aspx')) {
           result = await _showConsole();
           Navigator.pushReplacement( // chuyen den trang khac
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Scaffold(
                  
                  body: home( MSV: result,),
                                  );
              },
            ),
            );
          }
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

