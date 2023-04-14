import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class ToDo {
 @HiveType(typeId: 0)
  String? id;
   @HiveType(typeId: 0)
  String? contentTodo;
   @HiveType(typeId: 0)
  String? date;
   @HiveType(typeId: 0)
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