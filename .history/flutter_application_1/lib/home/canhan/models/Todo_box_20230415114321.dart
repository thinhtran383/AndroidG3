import 'package:hive/hive.dart';

// part 'person.g.dart';
part '''
Todo_box.g.dart''';

@HiveType(typeId: 0)
class todo extends HiveObject {
  
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
    @HiveField(7)
  bool isDone;

 todo({
    required this.id,
    this.isDone = false,
    required this.contentTodo,
    this.isLate = false,
    this.dateDone = false,
    required this.isDate,
    required this.date,
  });
   static List<todo> todoList() {
    return [
      // random data
      todo(id: "1", contentTodo: "Buy milk", isDone: false, isDate: 0,date: "20-11-2021",),
      todo(id: "2", contentTodo: "Buy eggs", isDone: false, isDate: 0,date: "21-11-2021"),
    ];
  }
}