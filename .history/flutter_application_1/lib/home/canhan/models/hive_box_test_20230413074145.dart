import 'package:hive/hive.dart';

part 'hiev_box_test.g.dart';

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
  @HiveField(5)
  bool isLate;
  @HiveField(6)
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
