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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: login(),
      // home: home(MSV: '21010627',),
      debugShowCheckedModeBanner: false,
    );
  }
}



// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.MSV}"),
//         automaticallyImplyLeading: false,
//       ),
      
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text('${data[index].TENPHONGHOC}'),
//                     subtitle: Text('${data[index].SOTIET}'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }