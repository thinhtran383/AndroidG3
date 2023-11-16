
import 'package:flutter/material.dart';
import '../constants/Colors.dart';
class SearchBox extends StatelessWidget {
  
  final Function(String) runSearch;

  const SearchBox({Key? key, required this.runSearch}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (value) => runSearch(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: SizedBox(
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Icon(
                        Icons.search,
                        color: tdBlack,
                        size: 20,
                      ),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 20),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  )
                ),
              ),  
            );
  }
   
}