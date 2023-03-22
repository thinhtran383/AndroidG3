import 'package:flutter/material.dart';

import '../constants/Colors.dart';
import '../widgets/SearchBox.dart';
import '../widgets/Todo_item.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SearchBox(),
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
                  ToDoItem(),
                ],
              ),
            )
          ],
        ),
      )
      
    );
}




AppBar buildAppBar(){
  return AppBar(
        elevation: 0,
         backgroundColor: tdBGColor,
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Icon(
               Icons.menu,
               color: tdBlack,
               ),
             Container(
               height: 40,
               width: 40,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(200),
                 child: Image.asset("#"),
               ),
             ), 
           ],
         ),
       );
}

}