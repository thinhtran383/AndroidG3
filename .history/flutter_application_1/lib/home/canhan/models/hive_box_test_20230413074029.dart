import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ToDo {
  @HiveField(index)(typeId: 0)
  String? id;
  @HiveField(index)(typeId: 0)
  String? contentTodo;
  @HiveField(index)(typeId: 0)
  String? date;
  @HiveField(index)(typeId: 0)
  bool isDone;
  @HiveField(index)(typeId: 0)
  int? isDate;
  @HiveField(index)(typeId: 0)
  bool isLate;
  @HiveField(index)(typeId: 0)
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
