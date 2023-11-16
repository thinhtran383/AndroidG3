import 'package:flutter/material.dart';

class TitleView extends StatelessWidget{
  final String contentTitle;
  const TitleView({Key? key, required this.contentTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          contentTitle,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      );
  }
}