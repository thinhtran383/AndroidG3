import 'package:flutter/material.dart';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 completed');
}
Future task2() async {
  var fiveSeconds = Duration(seconds: 5);

  String result = '';

  await Future.delayed(fiveSeconds, (){
    result = 'Task 2 data';  
    print('Task 2 completed');
  });
}

void task3() {
  String result = 'Task 3 data';
  print('Task 3 completed');
}
void task4() {
  String result = 'Task 1 data';
  print('Task 4 completed');
}
void task5() {
  String result = 'Task 1 data';
  print('Task 5 completed');
}
