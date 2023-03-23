import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  final onToDoChanged;
 

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      
      onTap: () {
        // print('Clicked on Todo Item.');
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tileColor: todo.isDone ? Colors.white:Colors.red,
      leading: Icon(
        todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: tdBlue,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          SizedBox(width: 8),
          Text(
            todo.date.toString(),
          )
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: listTile,
    );
  }
}
