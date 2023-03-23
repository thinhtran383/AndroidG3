import 'package:flutter/material.dart';

import '../constants/Colors.dart';
import '../models/ToDo.dart';
import '../widgets/SearchBox.dart';
import '../widgets/Todo_item.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key); 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final todoController = TextEditingController();

  List <ToDo> foundToDo = [];

  @override
  void initState() {
    foundToDo = todoList;
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
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
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      
                      for(ToDo todo in foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: onClickTodoItem,
                          onToDoDeleted: onClickDeleteIcon,
                          ),
                        
                    ],
                  ),
                )
              ],
            ),
          ),
          Align( // chinhs vi tri cua button va textfield
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
                      
                      controller: todoController,
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
                    onPressed: () {
                      addToDoIteam(todoController.text);
                    },
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
          ),
          
        ],
      )
      
    );
  } 

  void onClickTodoItem(ToDo todo){
      
      setState(() {
        todo.isDone = !todo.isDone;
      });
  }


  void onClickDeleteIcon(String id){
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
    });
  }

  void addToDoIteam(String toDo){
    setState(() {
      todoList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          contentTodo: toDo)
      );
    });

   todoController.clear();
  }

  void runSearch(String query){
    List<ToDo> result = [];
    if(query.isEmpty){
      result = todoList;
      } else {
        result = todoList.where((todo) => todo.contentTodo!.toLowerCase().contains(query.toLowerCase())).toList();
    }

    setState(() {
      foundToDo = result;
    });
  }


  AppBar buildAppBar(){
    return AppBar(
          elevation: 0,
          backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: tdBlack,
                ),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset("#"),
                ),
              ), 
            ],
          ),
        );
  }
}