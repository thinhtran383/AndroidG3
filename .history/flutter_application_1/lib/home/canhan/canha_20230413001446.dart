import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/Home.dart';
import 'package:hive_flutter/hive.dart';


class canhan extends StatelessWidget {
  Hive.initFlutter();
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
