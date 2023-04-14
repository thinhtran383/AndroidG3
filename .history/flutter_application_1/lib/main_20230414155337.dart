


import 'package:api/home/canhan/models/ToDoAdapter.dart';
import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'home/login.dart';




void main() async {
   await Hive.initFlutter();
  //  Hive.registerAdapter(ToDoAdapter());
  Hive.openBox('todoBox');
    Hive.openBox('todoBoxDone');
  
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      home: home(
        MSV: '21010627',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
