import 'dart:async';

import 'package:ClassPlanner/home/canhan/models/Todo_box.dart';
import 'package:ClassPlanner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/data/qldt.dart';
import 'home.dart';

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {
  double _opacity = 0;
  // late todo todouserid;
  // final tasksBox = Hive.box<todo>('tasks');


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: _opacity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (todouserid.hienthi == true)
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWebView(),
                        ));
                  },
                  child: Image.asset('assets/images/phenikaaLogo.png')),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 4),
              opacity: _opacity,
              child: Text(
                "Welcome Phenikaa!!!",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
