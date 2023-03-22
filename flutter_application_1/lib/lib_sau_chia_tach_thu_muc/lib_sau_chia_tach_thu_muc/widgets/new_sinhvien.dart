import 'package:flutter/material.dart';

class NewSinhVien extends StatelessWidget {
  //final Function addTx;
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  //NewTransaction(this.addTx);

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
              onPressed: () {
                print(maController.text);
                print(hoVaTenController.text);
                print(diemTotNghiepController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
