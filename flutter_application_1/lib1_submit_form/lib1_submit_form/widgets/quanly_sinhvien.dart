import 'package:flutter/material.dart';

import './new_sinhvien.dart';
import './list_sinhvien.dart';
import '../models/sinhvien.dart';

class QuanLySinhVien extends StatefulWidget {
  @override
  QuanLySinhVienTransactionsState createState() => QuanLySinhVienTransactionsState();
}

class QuanLySinhVienTransactionsState extends State<QuanLySinhVien> {
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

  void addNewSinhVien(String ma, String hoVaTen, double diemTotNghiep) {
    final newSinhVien = SinhVien(
      ma: ma,
      hoVaTen: hoVaTen,
      ngaySinh: DateTime.now(),
      diemTotNghiep: diemTotNghiep,
    );

    setState(() {
      danhSachSinhVien.add(newSinhVien);
    });
  }

  void removeSV(){

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewSinhVien(addNewSinhVien),
        SinhVienList(danhSachSinhVien),
      ],
    );
  }
}