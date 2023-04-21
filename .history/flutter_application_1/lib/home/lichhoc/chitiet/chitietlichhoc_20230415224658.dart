import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/data/data.dart';

class chitiet extends StatelessWidget {
   final List<Data> data;
  const chitiet({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
       text(wiget.data[0].TENMONHOC);
        ),
      ),
    );
  }
}