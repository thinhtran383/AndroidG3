import 'dart:ffi';

import 'package:flutter/material.dart';

class AddToDo  extends StatelessWidget {
  late final TextEditingController todoController;
  late final Function _selectDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                      child: Stack(
                        children: <Widget> [
                          TextField(
                            controller: todoController,
                            decoration: InputDecoration(
                              hintText: "Add new task",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Positioned(
                                  bottom: 9,
                                  right: 60,
                                  child: IconButton(
                                    onPressed: () {
                                      _selectDate(context);
                                      // print(currentDate);
                                    },
                                    icon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.black,
                                  size: 25,
                                  ),
                            )

                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Positioned(
                                  child: IconButton(
                                    onPressed: () {
                                      addToDoIteam(todoController.text);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                    
                            ],
                          ),

                         
                          
                        ],
                      ),
                    ),
  }

}