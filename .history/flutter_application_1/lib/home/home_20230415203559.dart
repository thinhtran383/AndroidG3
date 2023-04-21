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
import 'package:timer_builder/timer_builder.dart';
import 'bottomBar.dart';

class home extends StatefulWidget {
  final String MSV;

  home({required this.MSV});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late DateTime now;

  List<Data> data = [];
  int currentIndex = 0;
  late Box<todo> box;
  @override
  void initState() {
    calculateWeekDays();
  }

  void calculateWeekDays() {
    DateTime now = DateTime.now();
    // tính toán ngày đầu tiên và ngày cuối cùng của tuần
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime lastDayOfWeek = now.add(Duration(days: 7 - now.weekday));
    // sử dụng giá trị tính toán được ở đây
    int daylast = lastDayOfWeek.day;
    int monthlast = lastDayOfWeek.month;
    int yearlast = lastDayOfWeek.year;
    int dayfirst = firstDayOfWeek.day;
    int monthfirst = firstDayOfWeek.month;
    int yearfirst = firstDayOfWeek.year;

    switch (widget.MSV) {
      case '21010627':
        fetchData(
                '79BE3FF1328F49A397E15EFAF4E83870',
                dayfirst < 10
                    ? monthfirst > 10
                        ? '0${dayfirst}%2F${monthfirst}%2F${yearfirst}'
                        : '0${dayfirst}%2F0${monthfirst}%2F${yearfirst}'
                    : '${dayfirst}%2F0${monthfirst}%2F${yearfirst}',
                dayfirst < 10
                    ? monthfirst > 10
                        ? '0${dayfirst}%2F${monthfirst}%2F${yearfirst}'
                        : '0${dayfirst}%2F0${monthfirst}%2F${yearfirst}'
                    : '${dayfirst}%2F0${monthfirst}%2F${yearfirst}')
            .then((value) {
          setState(() {
            data = value;
          });
        });
        break;
      case '21010636':
        fetchData(
                '7EEE02F6121340B98E4F0530ECB0AD84',
                dayfirst < 10
                    ? '0${dayfirst}%2F0${monthfirst}%2F${yearfirst}'
                    : '${dayfirst}%2F0${monthfirst}%2F${yearfirst}',
                daylast < 10
                    ? '0${daylast}%2F0${monthlast}%2F${yearlast}'
                    : '${daylast}%2F0${monthlast}%2F${yearlast}')
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
