import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ToDo {
  @HiveField(0)(typeId: 0)
  String? id;
  @HiveField(0)(typeId: 0)
  String? contentTodo;
  @HiveField(0)(typeId: 0)
  String? date;
  @HiveField(0)(typeId: 0)
  bool isDone;
  @HiveField(0)(typeId: 0)
  int? isDate;
  @HiveField(0)(typeId: 0)
  bool isLate;
  @HiveField(0)(typeId: 0)
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
