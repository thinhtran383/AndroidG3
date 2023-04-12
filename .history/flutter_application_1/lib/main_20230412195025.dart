import 'dart:convert';

import 'package:api/home/home.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home/login.dart';
import 'network/network_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  Future<void> saveToDoList(List<ToDo> toDoList) async {
  final prefs = await SharedPreferences.getInstance();
  final json = jsonEncode(toDoList.map((todo) => todo.toJson()).toList());
  await prefs.setString('toDoList', json);
}
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



