import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App",
      home: Scaffold(
        backgroundColor: Colors.blue,
       
        
        
        

      
       
        appBar: AppBar(
          title: const Text(
            "Scaffold title",
          ),
        ),
      body:  Column(

        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              print("ElevatedButton");
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: Colors.green,
              onPrimary: Colors.white
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white, 
            ),
          )
        ] 
        ),
      drawer: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: const <Widget> [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "DrawerHeader",
            ),
            margin: const EdgeInsets.only(bottom: 8.0),
            padding:  const EdgeInsets.only(bottom: 8.0),
            duration: const Duration(milliseconds: 250),
          ),
          ListTile(
            title: const Text(
              "Home Page"
            ),
          ),
          ListTile(
            title: const Text("Mail"),
            leading: Icon(Icons.mail),
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            title: const Text("Thinh"),
          )
        ],
      ),
      ),
    );
 }

}