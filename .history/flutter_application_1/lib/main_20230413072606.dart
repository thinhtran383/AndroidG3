import 'dart:convert';

import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home/login.dart';
import 'network/network_request.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  var 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // home: login(),
      home: home(MSV: '21010627',),
      debugShowCheckedModeBanner: false,
    );
  }
}



