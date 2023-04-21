import 'dart:convert';

import 'package:api/home/canhan/models/Todo_box.dart';
import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'home/login.dart';
import 'network/network_request.dart';

late Box box;late Box boxdone;
void main()  async{


   await Hive.initFlutter();

  Hive.registerAdapter<todo>(todoAdapter());
  box = await Hive.openBox<todo>("tasks");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  
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



