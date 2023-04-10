import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/data/data.dart';
import '../network/network_request.dart';
import 'body.dart';
import 'bottomBar.dart';

class home extends StatefulWidget {
  final String MSV;
    

  home({required this.MSV});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Data> data = [];

  @override
  void initState() {
    super.initState();
   fetchData('79BE3FF1328F49A397E15EFAF4E83870', '03%2F03%2F2023',
        '09%2F04%2F2023')
    .then((value) {
  setState(() {
    data = value;
  });
});
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:null,

      body: Body(data: data,),
      bottomNavigationBar: bottomBar()

      
    );
  }
}
