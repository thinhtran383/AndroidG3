class ToDo {
  String? id;
  String? todoText;
  int? date;
  bool isDone;
  

  ToDo({
    required this.id,
    required this.todoText,
    required this.date,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: true,date:0),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true,date:0),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
        date:0
      ),
      ToDo(
        id: '04',
        todoText: 'Team Meeting',
        date:0
      ),
      ToDo(
        id: '05',
        todoText: 'Work on mobile apps for 2 hour',
        date:0
      ),
      ToDo(
        id: '06',
        todoText: 'Dinner with Jenny',
        date:0
      ),
    ];
  }
}
