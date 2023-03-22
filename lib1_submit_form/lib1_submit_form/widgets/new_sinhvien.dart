import 'package:flutter/material.dart';

class NewSinhVien extends StatelessWidget {
  final Function addSinhVien;

  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  NewSinhVien(this.addSinhVien);

  void submitData() {
    final enteredMa = maController.text;
    final enteredHoVaTen = hoVaTenController.text;
    final enteredDiemTotNghiep = double.parse(diemTotNghiepController.text);

    if (enteredMa.isEmpty || enteredHoVaTen.isEmpty || enteredDiemTotNghiep <= 0)
      return;

    addSinhVien(
      maController.text,
      hoVaTenController.text,
      double.parse(diemTotNghiepController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Mã sinh viên'),
              controller: maController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Họ và tên'),
              controller: hoVaTenController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Điểm tốt nghiệp'),
              controller: diemTotNghiepController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Thêm sinh viên'),
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
