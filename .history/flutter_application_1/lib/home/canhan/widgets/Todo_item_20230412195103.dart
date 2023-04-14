import 'package:flutter/material.dart';

import '../constants/Colors.dart';
import '../models/ToDo.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onToDoDeleted;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onToDoDeleted})
      : super(key: key);
Future<void> saveToDoList(List<ToDo> toDoList) async {
  final prefs = await SharedPreferences.getInstance();
  final json = jsonEncode(toDoList.map((todo) => todo.toJson()).toList());
  await prefs.setString('toDoList', json);
}
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
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  todo.contentTodo!,
                  style: TextStyle(
                    fontSize: 16,
                    color: todo.dateDone ? tdRed : tdBlack,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  todo.date.toString(),
                  style: TextStyle(

                    fontSize: 10,
                    color: todo.dateDone ? tdRed : tdBlack,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
            // Text(todo.isDate.toString())
          ],
        ),
        trailing: Container(
          // delete icon
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onToDoDeleted(todo.id); //
            },
          ),
        ),
      ),
    );
  }
}