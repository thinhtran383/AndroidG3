class ToDo {
  String? id;
  String? todoText;
  String? date;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.date,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: true,date:'' ),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true,date:''),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
        date:'20-3-2022'
      ),
      ToDo(
        id: '04',
        todoText: 'Team Meeting',
        date:''
      ),
      ToDo(
        id: '05',
        todoText: 'Work on mobile apps for 2 hour',
        date:''
      ),
      ToDo(
        id: '06',
        todoText: 'Dinner with Jenny',
        date:''
      ),
    ];
  }
}
