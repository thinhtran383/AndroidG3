import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var question = [
    "Question 1: What is your name?",
    "Question 2: What is your age?",
    "Question 3: Which is your favorite color?",
    "Question 4: Which is your favorite animal?",
    "Question 5: Which is your favorite food?",
  ];

  var questionIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: Scaffold(
        appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: const Text("Demo App"),
          ),          
        ),
      
        body: Container(
          child: Column(
            children: <Widget> [
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 50))
                ),
                child: const Text("Go to first"),
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                  });
                },
              ),

              SizedBox(
                height: 20,
                child: Container(
                  child: Text(
                    "123",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    ),
                ),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                    )
                  )
                ),
                onPressed: () {
                  setState(() {
                    questionIndex = 4;
                  });
                },
                child: const Text("Go to last")
                ),

              SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(150, 50))
                    ),
                    child: const Text("Next"),
                    onPressed: () {
                      setState(() {
                        questionIndex = questionIndex + 1;
                        if(questionIndex >= question.length) {
                          questionIndex = 0;
                        }
                      });
                    },
                  ),

                  SizedBox(width: 20),  

                  ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 50))
                ),
                child: const Text("Back"),
                onPressed: () {
                  setState(() {
                    questionIndex = questionIndex - 1;
                    if(questionIndex < 0) {
                      questionIndex = question.length - 1;
                    }
                  });
                },
              ),
                ],
              ),

            
              SizedBox(height: 20),

              Text(
                question[questionIndex],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),


            
            ],
          ),
        ),
      ),
      
    );
  }
}