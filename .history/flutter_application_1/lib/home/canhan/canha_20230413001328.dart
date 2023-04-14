import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/Home.dart';


class canhan extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
       
        home: Home(),
       );
  }
}
