import 'package:flutter/material.dart';

class TitleView extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
              title: Row(
                children: [
                  Icon(Icons.home, color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("Home"),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            );
  }

}