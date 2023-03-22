
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sample/my_button.dart';

class SinhVien {
  final String ma;
  final String hoVaTen;
  final DateTime ngaySinh;
  final double diemTotNghiep;

  SinhVien({required this.ma, required this.hoVaTen, required this.ngaySinh, required this.diemTotNghiep});
}

class DialogBox extends StatelessWidget {
  final controller;
  //String content;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key,required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 300,  
        child: Column(
          children: [
            Text(
              "Nhap thong tin sinh vien"
            ),
            SizedBox(height: 10,),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "content",
              ),
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8,),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }

}



class CardStudent extends StatelessWidget{
  List<SinhVien> danhSachSinhVien;
  CardStudent({required this.danhSachSinhVien});
  
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
                        horizontal: 12,
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
          ); 
  }


}

class ShowList extends StatelessWidget{
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
                        horizontal: 12,
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
          );
  }
  
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }

  
}



class MyHomePage extends StatelessWidget {

  final nhapTenSinhVien = TextEditingController();
  final nhapMaSinhVien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Column(
                children: [
                  AlertDialog(
                    backgroundColor: Colors.yellow[300],
                    content: Container(
                      height: 300,
                      child: Column(
                        children: [
                          const Text("Nhập thông tin sinh viên: "),
                          SizedBox(height: 10,),
                    
                          TextField(
                            controller: nhapTenSinhVien,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nhap ten sinh vien",
                            ),
                          ),

                          SizedBox(height: 10,),
                    
                          TextField(
                            controller: nhapMaSinhVien,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nhap ten sinh vien",
                            ),
                          ),

                          SizedBox(height: 10,),

                          Row(
                            children: [
                              MyButton(
                                text: "Save",
                                onPressed:() {

                                }),
                              const SizedBox(width: 8, height: 8,),
                              MyButton(
                                text: "Cancel",
                                onPressed: (){  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          
          ShowList(),
        ],
      ),
    );
  }
}
