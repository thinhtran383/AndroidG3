import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../models/ToDo.dart';
import '../widgets/AppBar.dart';
import '../widgets/SearchBox.dart';
import '../widgets/Todo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<ToDo> _toDoBox;
  bool _isAddingEvent = false;
  final todoList = ToDo.todoList();

  final todoController = TextEditingController();
  List<ToDo> foundToDo = [];
  List<ToDo> toDoListDone = [];

  @override
  void initState() {
    foundToDo = todoList;
  
    super.initState();
  }
   @override
  void dispose() {
    Hive.close(); // Close Hive instance when done
    super.dispose();
  }

  List<ToDo> get foundToDoBox =>
      _toDoBox.values.where((todo) => !todo.isDone).toList();

  List<ToDo> get toDoListDoneBox =>
      _toDoBox.values.where((todo) => todo.isDone).toList();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 20),
                  child: SearchBox(runSearch: (p0) => runSearch(p0)),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "ToDo",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo
                          in foundToDo.reversed) // in ra danh sach todo
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: onClickTodoItem,
                          onToDoDeleted: onClickDeleteIcon,
                        ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      for (ToDo todo
                          in toDoListDone.reversed) // in ra danh sach todo
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: onClickToDoItemDone,
                          onToDoDeleted: onClickDeleteIcon,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
              visible: _isAddingEvent,
              child: Align(
                // chinhs vi tri cua button va textfield
                alignment: Alignment.bottomCenter,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25, right: 25, left: 25),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
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
                      child: Expanded(
                        child: Stack(
                          children: <Widget>[
                            TextField(
                              controller: todoController,
                              decoration: InputDecoration(
                                hintText: "Add new task",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Positioned(
                                      bottom: 9,
                                      right: 60,
                                      child: IconButton(
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Positioned(
                                    child: IconButton(
                                      onPressed: () {
                                        _addToDoItem(todoController.text);
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
                    ),
                  ),
                ]),
              ))
        ],
      ),

      floatingActionButton: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _isAddingEvent
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isAddingEvent = true;
                  });
                },
                child: Icon(Icons.add, color: Colors.white),
                backgroundColor: Colors.blue,
              ),
      ),
      // vị trí của nút thêm lịch
    );
  }

  void onClickToDoItemDone(ToDo todo) {
    setState(() {
      // check box

      todo.isDone = !todo.isDone;
    });

    if (todo.isDone) {
      setState(() {
        todo.isDone = true;
        toDoListDone.add(todo);
        todoList.removeWhere((todo) => todo.isDone == true);
      });
    } else {
      setState(() {
        todo.isDone = false;
        todoList.add(todo);
        toDoListDone.removeWhere((todo) => todo.isDone == false);
      });
    }
  }

  void onClickTodoItem(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });

    if (todo.isDone) {
      toDoListDone.add(todo);
      setState(() {
        todoList.removeWhere((todoo) => todoo.id == todo.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(// hien thi thong bao
          SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          "Task completed",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
        elevation: 100,
      ));
    }
  }

  void onClickDeleteIcon(String id) {
    setState(() {
      todoList.removeWhere((todoo) => todoo.id == id);
      toDoListDone.removeWhere((todoo) => todoo.id == id);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Text(
        "Task deleted",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        final difference = pickedDate.difference(DateTime.now());
        final seconds = difference.inSeconds;
        currentDate = pickedDate;
      });
    }
  }

  void _addToDoItem(String toDo) {
    DateTime now = DateTime.now();
    DateTime seletedDate = currentDate;
    String datenow = DateFormat('dd-MM-yyyy').format(currentDate);
    Duration difference = seletedDate.difference(now);
    int seconds = difference.inHours;

    setState(() {
      _isAddingEvent = false;

      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        contentTodo: toDo,
        isDate: seconds,
        date: datenow,
      ));
    });

    todoController.clear();
  }

  void runSearch(String query) {
    List<ToDo> result = [];
    if (query.isEmpty) {
      // neu khong co gi thi khong lam gi ca
      result = todoList;
    } else {
      result = todoList
          .where((todo) =>
              todo.contentTodo!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = result;
    });
  }
}
