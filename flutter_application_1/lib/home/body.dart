import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/data/data.dart';
import '../network/network_request.dart';

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

  Body({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String gioBatDau='';
              String gioKetThuc='';
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
                    gioBatDau = '13h';
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
                    gioKetThuc = '13h';
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
             
             
              
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'THỨ \n ${data[index].THU}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ), // Hiển thị thông tin thứ
                                    SizedBox(width: 10.0),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('${data[index].TENHOCPHAN}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                        Text('${data[index].TENPHONGHOC}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                      ],
                                    ),
                                    SizedBox(width: 10.0),
                    
                                    Text(
                                      '$gioBatDau \n $gioKetThuc',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ), //
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}