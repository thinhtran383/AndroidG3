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
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
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
            SizedBox(height: 5),
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
                Text(data[currentIndex].SOTIET.t),
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
                Text(data[currentIndex].TIETBATDAU),
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
                Text(data[currentIndex].TIETKETTHUC),
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
    );
  }
}
