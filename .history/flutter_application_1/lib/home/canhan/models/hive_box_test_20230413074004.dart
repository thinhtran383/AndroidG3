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
   @HiveType(typeId: 0)
  int? isDate;
   @HiveType(typeId: 0)
  bool isLate;
   @HiveType(typeId: 0)
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