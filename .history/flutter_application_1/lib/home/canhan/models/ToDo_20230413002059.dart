import 'package:hive_flutter/adapters.dart';

class ToDo {

  final _myBox = Hive.box('myBox');
  String? id;
  String? contentTodo;
  String? date;
  bool isDone;
  int? isDate;
  bool isLate;
  bool dateDone;
  ToDo({
    required this.id,
    this.isDone = false,
    required this.contentTodo,
    this.isLate = false,
    this.dateDone = false,
    required this.isDate,
    required this.date,
  });

  static List<ToDo> todoList() {
    return [
      // random data
      ToDo(id: "1", contentTodo: "Buy milk", isDone: false, isDate: 0,date: "20-11-2021",),
      ToDo(id: "2", contentTodo: "Buy eggs", isDone: false, isDate: 0,date: "21-11-2021"),
    ];
  }

  // factory ToDo.fromJson(Map<String, dynamic> json) {
  //   return ToDo(
  //     id: json['id'] as String,
  //     contentTodo: json['contentTodo'] as String,
  //     date: json['date'] as String,
  //     isDone: json['isDone'] as bool,
  //     dateDone: json['dateDone'] as bool,
  //      isDate: null,
  //   );
  // }
  //  Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'contentTodo': contentTodo,
  //     'date': date.toString(),
  //     'isDone': isDone,
  //     'dateDone': dateDone,
  //   };
  // }

  
}
