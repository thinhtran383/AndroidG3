import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ToDo {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? contentTodo;
  @HiveField(2)
  String? date;
  @HiveField(3)
  bool isDone;
  @HiveField(4)
  int? isDate;
  @HiveField(0)
  bool isLate;
  @HiveField(0)
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
