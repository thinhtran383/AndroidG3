import 'dart:async';

import 'package:ClassPlanner/home/canhan/canha.dart';
import 'package:ClassPlanner/home/diemcanha/diem.dart';
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
import 'lichhoc/chitiet/chitietlichhoc.dart';

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
                    : monthfirst > 10
                        ? '${dayfirst}%2F${monthfirst}%2F${yearfirst}'
                        : '${dayfirst}%2F0${monthfirst}%2F${yearfirst}',
                daylast < 10
                    ? monthfirst > 10
                        ? '0${daylast}%2F${monthlast}%2F${yearlast}'
                        : '0${daylast}%2F0${monthlast}%2F${yearlast}'
                    : monthfirst > 10
                        ? '${daylast}%2F${monthlast}%2F${yearlast}'
                        : '${daylast}%2F0${monthlast}%2F${yearlast}')
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
                    ? monthfirst > 10
                        ? '0${dayfirst}%2F${monthfirst}%2F${yearfirst}'
                        : '0${dayfirst}%2F0${monthfirst}%2F${yearfirst}'
                    : monthfirst > 10
                        ? '${dayfirst}%2F${monthfirst}%2F${yearfirst}'
                        : '${dayfirst}%2F0${monthfirst}%2F${yearfirst}',
                daylast < 10
                    ? monthfirst > 10
                        ? '0${daylast}%2F${monthlast}%2F${yearlast}'
                        : '0${daylast}%2F0${monthlast}%2F${yearlast}'
                    : monthfirst > 10
                        ? '${daylast}%2F${monthlast}%2F${yearlast}'
                        : '${daylast}%2F0${monthlast}%2F${yearlast}')
            .then((value) {
          setState(() {
            data = value;
          });
        });
        break;
      case '':
        break;
      default:
    }
    Timer.periodic(Duration(days: 1), (timer) {
      now = DateTime.now();
      firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
      lastDayOfWeek = now.add(Duration(days: 7 - now.weekday));

      daylast = lastDayOfWeek.day;
      monthlast = lastDayOfWeek.month;
      yearlast = lastDayOfWeek.year;
      dayfirst = firstDayOfWeek.day;
      monthfirst = firstDayOfWeek.month;
      yearfirst = firstDayOfWeek.year;
    });
  }

  @override
  Widget build(BuildContext context) {
    TimerBuilder.periodic(Duration(days: 1), builder: (context) {
      DateTime now = DateTime.now();
      DateTime firstDayOfWeeknew =
          now.subtract(Duration(days: now.weekday - 1));
      DateTime lastDayOfWeeknuew = now.add(Duration(days: 7 - now.weekday));
      // Cập nhật giá trị của bạn tại đây

      return SizedBox.shrink();
    });
    return Scaffold(
        appBar: null,
        body: currentIndex == 0
            ? Body(
                data: data,
                currentIndex: currentIndex,
              )
            : currentIndex == 1
                ? diemcanhan()
                : currentIndex == 2
                    ? canhan()
                    : chitiet( onCurrentIndexChanged: (int currentIndex) {
            setState(() {
              this.currentIndex = currentIndex;
            });
          },),
        bottomNavigationBar: bottomBar(
          onCurrentIndexChanged: (int currentIndex) {
            setState(() {
              this.currentIndex = currentIndex;
            });
          },
        ));
  }
}
