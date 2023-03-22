import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/sinhvien.dart';

class SinhVienList extends StatelessWidget {
  final List<SinhVien> danhSachSinhVien;

  SinhVienList(this.danhSachSinhVien);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    DateFormat('dd-MM-yyyy').format(sv.ngaySinh),
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
    );
  }
}