import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class chi extends StatelessWidget {
  const chi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: Placeholder(
          color: Colors.blue,
        ),
      ),
    );
  }
}