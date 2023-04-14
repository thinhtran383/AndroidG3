import 'dart:convert';

import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home/canhan/models/ToDo.dart';
import 'home/login.dart';
import 'network/network_request.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {
// Initialize Hive
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);

  // Register adapter for ToDo class
  Hive.registerAdapter(appDirectory());

  // Open ToDo box
  await Hive.openBox<ToDo>('todoBox');

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
