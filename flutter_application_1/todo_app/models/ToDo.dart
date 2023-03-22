class ToDo{
  String? id;
  String? contentTodo;
  bool isDone;

  ToDo({required this.id, this.isDone = false, required this.contentTodo});


  static List<ToDo> todoList() { 
    return [
      // random data
      ToDo(id: "1", contentTodo: "Buy milk", isDone: false),
      ToDo(id: "2", contentTodo: "Buy eggs", isDone: true),
      ToDo(id: "3", contentTodo: "Buy bread", isDone: false),
      ToDo(id: "4", contentTodo: "Buy butter", isDone: true),
      ToDo(id: "5", contentTodo: "Buy cheese", isDone: false),
      ToDo(id: "6", contentTodo: "Buy meat", isDone: true),
    
    ];
  }
}