import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class ToDo {
 @HiveType(typeId: 0)
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
}