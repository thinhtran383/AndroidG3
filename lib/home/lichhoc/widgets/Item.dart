import 'package:ClassPlanner/model/data/data.dart';
import 'package:flutter/material.dart';


class Item extends StatefulWidget{
  final List<Data> data;

  const Item({super.key, required this.data});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              String gioBatDau = '';
              String gioKetThuc = '';
              switch (widget.data[index].TIETBATDAU) {
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
              switch (widget.data[index].TIETKETTHUC) {
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

              return Container(
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
                                    
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.data[index].THU == '8' ? "CHỦ \n  NHẬT" : "THỨ \n ${widget.data[index].THU}"}',
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
                                          Text(
                                              '${widget.data[index].TENHOCPHAN}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color.fromRGBO(
                                                    30, 30, 30, 1.0),
                                              )),
                                          Text(
                                              '${widget.data[index].TENPHONGHOC}',
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
        );
  }
}
