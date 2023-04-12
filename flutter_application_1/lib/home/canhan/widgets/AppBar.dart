import 'package:flutter/material.dart';
import '../constants/Colors.dart';
class appBar{
  AppBar buildAppBar(){
    return AppBar(
          elevation: 0,
          backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // cach nhau
            children: [
              Icon(
                Icons.menu,
                color: tdBlack,
                ),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect( // bo tron anh
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/phenikaaLogo.png'),
                ),
              ), 
            ],
          ),
        );
  }

}
  
  