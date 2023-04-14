import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? contentTodo;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  DateTime? completedDate; 

  Task({
    required this.title,
    required this.description,
    required this.inputDate,
    this.isCompleted = false,
  });
}