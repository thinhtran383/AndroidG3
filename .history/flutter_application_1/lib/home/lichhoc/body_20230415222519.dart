import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/data/data.dart';
import '../../network/network_request.dart';





class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class Body extends StatelessWidget {
  List<dynamic> time = [
    '6h45',
    '7h40',
    '8h35',
    '9h30',
    '10h25',
    '11h20',
    '12h15',
    '13h10',
    '14h05',
    '15h00',
    '15h55',
    '16h50',
    '17h45'
  ];
  final List<Data> data;
  final int currentIndex;

  Body({Key? key, required this.data, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String gioBatDau = '';
              String gioKetThuc = '';
              switch (data[index].TIETBATDAU) {
                case 1:
                  gioBatDau = '6h45';
                  break;
                case 2:
                  gioBatDau = '7h40';
                  break;
                case 3:
                  gioBatDau = '8h35';
                  break;
                case 4:
                  gioBatDau = '9h30';
                  break;
                case 5:
                  gioBatDau = '10h25';
                  break;
                case 6:
                  gioBatDau = '11h20';
                  break;
                case 7:
                  gioBatDau = '13h00';
                  break;
                case 8:
                  gioBatDau = '13h55';
                  break;
                case 9:
                  gioBatDau = '14h50';
                  break;
                case 10:
                  gioBatDau = '15h45';
                  break;
                case 11:
                  gioBatDau = '16h40';
                  break;
                case 12:
                  gioBatDau = '17h35';
                  break;
                default:
              }
              switch (data[index].TIETKETTHUC) {
                case 1:
                  gioKetThuc = '6h45';
                  break;
                case 2:
                  gioKetThuc = '7h40';
                  break;
                case 3:
                  gioKetThuc = '8h35';
                  break;
                case 4:
                  gioKetThuc = '9h30';
                  break;
                case 5:
                  gioKetThuc = '10h25';
                  break;
                case 6:
                  gioKetThuc = '11h20';
                  break;
                case 7:
                  gioKetThuc = '13h00';
                  break;
                case 8:
                  gioKetThuc = '13h55';
                  break;
                case 9:
                  gioKetThuc = '14h50';
                  break;
                case 10:
                  gioKetThuc = '15h45';
                  break;
                case 11:
                  gioKetThuc = '16h40';
                  break;
                case 12:
                  gioKetThuc = '17h35';
                  break;
                default:
              }

              return GestureDetector(
                onTap: (){
                   setState(() {
          // Cập nhật giá trị tại thằng cha
          parent.updateValue(newValue);
        });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data[index].THU == '8' ? "CHỦ \n  NHẬT" : "THỨ \n ${data[index].THU}"}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ), // Hiển thị thông tin thứ
                                      SizedBox(width: 10.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('${data[index].TENHOCPHAN}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color.fromRGBO(
                                                    30, 30, 30, 1.0),
                                              )),
                                          Text('${data[index].TENPHONGHOC}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 10.0),
              
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('$gioBatDau',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    30, 30, 30, 1.0),
                                                fontSize: 18.0,
                                              )),
                                          Text('${gioKetThuc}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              )),
                                        ],
                                      ),
              
                                      //
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
