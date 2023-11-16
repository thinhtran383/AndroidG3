// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// // import '../constants/Colors.dart';
// import '../models/ToDo.dart';
// class ToDoItem extends StatelessWidget {
//   final ToDo todo;
//   final onToDoChanged;
//   final onToDoDeleted;
//   const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onToDoDeleted}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20),
//       child: ListTile(
//         onTap: () {
//           onToDoChanged(todo); // 
//         },
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         tileColor: Colors.white ,
//         leading: Icon(
//           todo.isDone ? Icons.check_box : Icons.check_box_outline_blank ,
//           color: Colors.green,
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text( 
//               todo.contentTodo!, 
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//               decoration: todo.isDone ?  TextDecoration.lineThrough : null,
//               ),
//             ),
//             SizedBox(height: 5,), 
//             Text( // hien thi ngay
//               todo.date!,
//               style: TextStyle(
//                 fontSize: 10,
//                 color: isCurrentDate(todo.date) ? Colors.grey : Colors.red,
//               ),
//             )
//           ],
//         ),

//         trailing: Container( // delete icon
//           height: 35,
//           width: 35,
//           decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: IconButton(
//             color: Colors.white,
//             iconSize: 18,
//             icon: Icon(Icons.delete_forever),
//             onPressed: (){
//               onToDoDeleted(todo.id); //
//             },
//           ),
//         ),
//       ),
//     );
//   }



//   bool isCurrentDate(String date) {
//     String otherDateStr = todo.date;
//     if(otherDateStr == " "){
//       return true;
//     }

    
//     DateTime otherDate = DateFormat("dd-MM-yyyy").parse(otherDateStr);

//     DateTime _currentDate = DateTime.now();

//     bool isDateAfterToday = _currentDate.isAfter(otherDate);
//     if(isDateAfterToday){
//       return false;
//     }
//     return true;
//   }

// }