

import 'package:flutter/material.dart';

import '../constants/Colors.dart';
import '../models/ToDo.dart';

class TodoController extends StatelessWidget{
  
  final VoidCallback myFunction;

  static String content = "";
  static final todoControler = TextEditingController();
  TodoController({required this.myFunction});
  
  @override
  Widget build(BuildContext context) {
    return Align( // chinhs vi tri cua button va textfield
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget> [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset.zero, 
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todoControler,
                      decoration: InputDecoration(
                        hintText: "Add new task",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                  ),
                ),
                 Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: myFunction,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: const Size(60,60),
                      elevation: 5,
                    ),

                  ),
                  ),
                
              ]
            ),
          );
  }



  static void returnContent(){
    content = todoControler.text;
  }

}