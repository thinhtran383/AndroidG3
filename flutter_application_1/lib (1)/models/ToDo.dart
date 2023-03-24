class ToDo {
  String? id;
  String? contentTodo;
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
  });

  static List<ToDo> todoList() {
    return [
      // random data
      ToDo(id: "1", contentTodo: "Buy milk", isDone: false, isDate: 0),
      ToDo(id: "2", contentTodo: "Buy eggs", isDone: false, isDate: 0),
     
    ];
  }
}
