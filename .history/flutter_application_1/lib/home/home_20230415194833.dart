import 'package:api/home/canhan/canha.dart';
import 'package:api/home/diemcanha/diem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/data/data.dart';
import '../network/network_request.dart';
import 'canhan/models/Todo_box.dart';
import 'lichhoc/body.dart';
import 'package:';
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
  void initState() {
    checkDanngNhap() ;
  }

  void checkDanngNhap() {
    switch (widget.MSV) {
      case '21010627':
      
        fetchData('79BE3FF1328F49A397E15EFAF4E83870', '03%2F03%2F2023',
                '09%2F04%2F2023')
            .then((value) {
          setState(() {
            data = value;
          });
        });
        break;
      case '21010636':
       fetchData('7EEE02F6121340B98E4F0530ECB0AD84', '03%2F03%2F2023',
                '09%2F04%2F2023')
            .then((value) {
          setState(() {
            data = value;
          });
        });
        break;
      case '21010627':
        break;
      default:
    }
  }

  TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
  DateTime now = DateTime.now();
  DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
  DateTime lastDayOfWeek = now.add(Duration(days: 7 - now.weekday));
  // Cập nhật giá trị của bạn tại đây
  return SizedBox.shrink();
});


  DateTime now = DateTime.now();
  DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

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
