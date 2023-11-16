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
  Body({Key? key, required this.data}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Item(data: widget.data)
      ],
    );
  }
}
