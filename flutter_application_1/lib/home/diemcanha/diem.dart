import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class diemcanhan extends StatefulWidget {
  const diemcanhan({super.key});

  @override
  State<diemcanhan> createState() => _diemcanhanState();
}

class _diemcanhanState extends State<diemcanhan> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: null,
      body: Container(
        child: Placeholder(
          color: Colors.blue,
        ),
      ),
    );
  }
}