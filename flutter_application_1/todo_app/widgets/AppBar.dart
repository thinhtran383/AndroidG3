import 'package:flutter/material.dart';
import '../constants/Colors.dart';
class appBar{
  AppBar buildAppBar(){
    return AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect( // bo tron anh
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset("#"),
                ),
              ), 
            ],
          ),
        );
  }

}
  
  