import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? contentTodo;

  @HiveField(2)
  String? date;

  @HiveField(3)
  bool? isDone;

  @HiveField(4)
  int? isDate; 
    @HiveField(5)
  bool? isLate; 
      @HiveField(6)
  bool? isLate; 

  todo({
    required this.title,
    required this.description,
    required this.inputDate,
    this.isCompleted = false,
  });
}