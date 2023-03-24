
class ToDo{
  String? date;
  String? id;
  String? contentTodo;
  bool isDone;
  bool isLate;
  ToDo({required this.id, this.isDone = false, required this.contentTodo, this.isLate = false, this.date = " "});
  


  static List<ToDo> todoList() { 
    return [
      // random data
      ToDo(id: "1", contentTodo: "Buy milk", isDone: false),
      ToDo(id: "2", contentTodo: "Buy eggs", isDone: false),
      ToDo(id: "3", contentTodo: "Buy bread", isDone: false),
      ToDo(id: "4", contentTodo: "Buy butter", isDone: false),
      ToDo(id: "5", contentTodo: "Buy cheese", isDone: false),
      ToDo(id: "6", contentTodo: "Buy meat", isDone: false),
    
    ];
  }
}