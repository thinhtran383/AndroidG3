
import 'package:flutter/material.dart';
import '../models/ToDo.dart';
import '../widgets/AppBar.dart';
import '../widgets/SearchBox.dart';
import '../widgets/Todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key); 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 

  final todoList = ToDo.todoList();
  final todoController = TextEditingController();
  List <ToDo> foundToDo = [];

  @override
  void initState() {
    foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar().buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                
                SearchBox(runSearch: (p0) => runSearch(p0)),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "ToDo List",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      
                      for(ToDo todo in foundToDo.reversed) // in ra danh sach todo
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: onClickTodoItem,
                          onToDoDeleted: onClickDeleteIcon,
                          ),
                      
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      for(ToDo todo in foundToDo.reversed) // in ra danh sach todo
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: onClickTodoItem,
                          onToDoDeleted: onClickDeleteIcon,
                          ),
                     
                      
                    ],
                  ),
                )
              ],
            ),
          ),
          Align( // chinhs vi tri cua button va textfield
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget> [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25, right: 25, left: 25),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.grey,
                        //   spreadRadius: 0,
                        //   blurRadius: 10,
                        //   offset: Offset.zero, 
                        // ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Expanded(
                      child: Stack(
                        children: <Widget> [
                          TextField(
                            controller: todoController,
                            decoration: InputDecoration(
                              hintText: "Add new task",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            ),
                          ),

                          
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Positioned(
                                  bottom: 9,
                                  right: 60,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.black,
                                  size: 25,
                                  ),
                            )

                                ),
                              ),

                              SizedBox(width: 20,),

                              SizedBox(
                                height: 50,
                                child: Positioned(
                                  child: IconButton(
                                    onPressed: () {
                                      addToDoIteam(todoController.text);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                    
                            ],
                          ),

                         
                          
                        ],
                      ),
                    ),

                    // child: Row(
                    //   children: [
                    //     Expanded(
                    //       child: Stack(
                    //           children: <Widget>[ TextField(
                    //           controller: todoController,
                    //           decoration: InputDecoration(
                    //             hintText: "Add new task",
                    //             hintStyle: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 16,
                    //             ),
                    //             border: InputBorder.none,
                    //             contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    //           ),
                    //         ),

                            

                    //       ],
                    //     ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),


            
                //  Container(
                //   margin: EdgeInsets.only(bottom: 20, right: 20),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       addToDoIteam(todoController.text);
                //     },
                //     child: Icon(
                //       Icons.add,
                //       color: Colors.white,
                //       size: 20,
                //     ),
                    
                //     style: ElevatedButton.styleFrom(
                //       primary: tdBlue,
                //       minimumSize: const Size(60,60),
                //       elevation: 5,
                //     ),

                //   ),
                //   ),
                
              ]
            ),
          ),
         
        ],
      )
      
    );
  } 

  void onClickTodoItem(ToDo todo){
      setState(() {
        todo.isDone = !todo.isDone;
        
      });

      if(todo.isDone){
        
        setState(() {
          todo.isDone = true;
          todoList.removeWhere((todo) => todo.isDone == true);
        });

        ScaffoldMessenger.of(context).showSnackBar( // hien thi thong bao
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
              "Task completed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            elevation: 100,
          )
        );
      } 
      //else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text("Task uncompleted"),
      //       duration: Duration(seconds: 1),
      //       backgroundColor: Colors.red,
      //     )
      //   );
      // }
  }


  void onClickDeleteIcon(String id){
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
    });

    
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
    ),
        
        content: Text(
          "Task deleted",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      )
    );
  }

  void addToDoIteam(String toDo){
    setState(() {
      if(toDo.isEmpty) return; // neu khong co gi thi khong lam gi ca
      todoList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(), // 
          contentTodo: toDo)
      );
    });

  todoController.clear();
  }

  void runSearch(String query){
    List<ToDo> result = [];
    if(query.isEmpty){ // neu khong co gi thi khong lam gi ca
      result = todoList;
      } else {
        result = todoList.where((todo) => todo.contentTodo!.toLowerCase().contains(query.toLowerCase())).toList();
    }

    setState(() {
      foundToDo = result;
    });
  }



  
}