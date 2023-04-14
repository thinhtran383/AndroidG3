import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ToDo {
  @Hive(typeId: 0)
  String? id;
  @Hive(typeId: 0)
  String? contentTodo;
  @Hive(typeId: 0)
  String? date;
  @Hive(typeId: 0)
  bool isDone;
  @Hive(typeId: 0)
  int? isDate;
  @Hive(typeId: 0)
  bool isLate;
  @Hive(typeId: 0)
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
