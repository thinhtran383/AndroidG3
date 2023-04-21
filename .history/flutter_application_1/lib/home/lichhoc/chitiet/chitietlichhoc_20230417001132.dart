import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/data/data.dart';

class chitiet extends StatelessWidget {
  final List<Data> data;
  final int currentIndex;
  const chitiet({super.key, required this.data, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return  margin: EdgeInsets.symmetric(vertical: 10),(
       margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[currentIndex].TENHOCPHAN,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Thứ:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].THU),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Số tiết:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].SOTIET.toString()),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Tiết bắt đầu:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].TIETBATDAU.toString()),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Tiết kết thúc:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].TIETKETTHUC.toString()),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Phòng học:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].TENPHONGHOC),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Buổi học:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(data[currentIndex].BUOIHOC),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
