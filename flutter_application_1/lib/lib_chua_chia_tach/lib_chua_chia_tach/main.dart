import 'package:flutter/material.dart';
import 'sinhvien.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<SinhVien> danhSachSinhVien = [
    SinhVien(ma: '2345678',
        hoVaTen: 'Nguyen Quynh Nga',
        ngaySinh: DateTime(2003, 12, 02),
        diemTotNghiep: 7.8),
    SinhVien(ma: '3336688',
        hoVaTen: 'Tran Van Quang',
        ngaySinh: DateTime(2002, 06, 27),
        diemTotNghiep: 8.5),
  ];

  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Mã sinh viên'),
                  controller: maController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Họ và tên'),
                  controller: hoVaTenController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Điểm tốt nghiệp'),
                  controller: diemTotNghiepController,
                ),
                TextButton(
                  child: Text('Add Transaction'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Column(
            children: danhSachSinhVien.map((sv) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        sv.diemTotNghiep.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          sv.ma + ' - ' + sv.hoVaTen,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          sv.ngaySinh.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}