import 'package:flutter/material.dart';
import '../models/ToDoDone.dart';
import '../constants/Colors.dart';
import '../models/ToDoDone.dart';


class ToDoItemDone extends StatelessWidget {
  final ToDoDone todo;
  final onToDoChanged;

  const ToDoItemDone({Key? key, required this.todo, required this.onToDoChanged, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo); // 
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white ,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank ,
          color: tdBlue ,
        ),
        title:
         Text(
          todo.contentTodo!,
        style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: todo.isDone ?  TextDecoration.lineThrough : null,
          ),
        ),
        

       
      ),
    );
  }

}