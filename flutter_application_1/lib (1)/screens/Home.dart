import 'dart:async';

import 'package:flutter/material.dart';
import '../models/ToDo.dart';
import '../widgets/AppBar.dart';
import '../widgets/SearchBox.dart';
import '../widgets/Todo_item.dart';
import '../widgets/Todo_itemDone.dart';
import '../models/ToDoDone.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final todoListDone = ToDoDone.todoList();

  final todoController = TextEditingController();
  List<ToDo> foundToDo = [];
  List<ToDoDone> foundToDoDone = [];

  @override
  void initState() {
    foundToDo = todoList;
    foundToDoDone = todoListDone;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar().buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SearchBox(runSearch: (p0) => runSearch(p0)),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "ToDo List",
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
                              margin: EdgeInsets.only(top: 50, bottom: 20),
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        for (ToDoDone todo
                            in foundToDoDone.reversed) // in ra danh sach todo
                          ToDoItemDone(
                            todo: todo,
                            onToDoChanged: onClickTodoItemDone,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
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
            ),
          ],
        ));
  }

  void onClickTodoItem(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });

    if (todo.isDone) {
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

  void onClickTodoItemDone(ToDoDone todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void onClickDeleteIcon(String id) {
    ToDo todo = todoList.firstWhere((element) => element.id == id);
    setState(() {
      todoList.removeWhere((todoo) => todoo.id == id);
      todoListDone.add(ToDoDone(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          isDone: true, //
          contentTodo: todo.contentTodo));
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
    _selectDate(context).then((value) {
      DateTime now = DateTime.now();
      DateTime seletedDate = currentDate;

      Duration difference = seletedDate.difference(now);
      int seconds = difference.inHours;
      if (seconds < 0) seconds = 0;

      setState(() {
        todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          contentTodo: toDo,
          isDate: seconds,
        ));
      });
      String nowid = DateTime.now().millisecondsSinceEpoch.toString();
      ToDo todo = todoList.firstWhere((element) => element.id == nowid);

      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          seconds--;
          todo.isDate = seconds;
          if (seconds == 0) {
            todo.dateDone = true;

            timer.cancel();
          }
        });
      });
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
