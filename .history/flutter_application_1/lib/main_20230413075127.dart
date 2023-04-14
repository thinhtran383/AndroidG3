import 'dart:convert';

import 'package:api/home/canhan/models/ToDo.dart';
import 'package:api/home/canhan/models/ToDoAdapter.dart';
import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'home/login.dart';
import 'network/network_request.dart';


late Box box;
void main() async {
  await Hive.initFlutter();
  Box box =  await Hive.box('myBox');
  Hive.resetAdapters(ToDoAdapter());
  List<ToDo>

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: login(),
      home: home(
        MSV: '21010627',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}