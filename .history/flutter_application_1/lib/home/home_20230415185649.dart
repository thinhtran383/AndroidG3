import 'package:api/home/canhan/canha.dart';
import 'package:api/home/diemcanha/diem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/data/data.dart';
import '../network/network_request.dart';
import 'canhan/models/Todo_box.dart';
import 'lichhoc/body.dart';
import 'bottomBar.dart';

class home extends StatefulWidget {
  final String MSV;

  home({required this.MSV});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Data> data = [];
  int currentIndex = 0;
  late Box<todo> box;
  @override
  void initState() async {
    await Hive.initFlutter();
    initializeHive();

    super.initState();
    fetchData('79BE3FF1328F49A397E15EFAF4E83870', '03%2F03%2F2023',
            '09%2F04%2F2023')
        .then((value) {
      setState(() {
        data = value;
      });
    });
  }

  void initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<todo>(todoAdapter());
    box = await Hive.openBox<todo>("tasks");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: currentIndex == 0
            ? Body(
                data: data,
              )
            : currentIndex == 1
                ? diemcanhan()
                : canhan(),
        bottomNavigationBar: bottomBar(
          onCurrentIndexChanged: (int currentIndex) {
            setState(() {
              this.currentIndex = currentIndex;
            });
          },
        ));
  }
}
