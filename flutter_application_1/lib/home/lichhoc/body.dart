import 'dart:ffi';

import 'package:ClassPlanner/home/lichhoc/widgets/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/data/data.dart';
import '../../network/network_request.dart';



class Body extends StatefulWidget {
  final List<Data> data;
  // late final int currentIndex;
  Body({Key? key, required this.data })
      : super(key: key);
       
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> time = [
    '6h45',
    '7h40',
    '8h35',
    '9h30',
    '10h25',
    '11h20',
    '12h15',
    '13h10',
    '14h05',
    '15h00',
    '15h55',
    '16h50',
    '17h45'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Item(data: widget.data),
      ],
    );
  }
}
