import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(title: 'Calculator'),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  CalculatorHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String input = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      setState(() {
        input = '';
        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      setState(() {
        num1 = double.parse(input);
        operand = buttonText;
        input = '';
      });
    } else if (buttonText == '.') {
      setState(() {
        if (!input.contains('.')) {
          input = input + '.';
        }
      });
    } else if (buttonText == '=') {
      setState(() {
        num2 = double.parse(input);

        switch (operand) {
          case '+':
            input = (num1 + num2).toStringAsFixed(2);
            break;

          case '-':
            input = (num1 - num2).toStringAsFixed(2);
            break;

          case '*':
            input = (num1 * num2).toStringAsFixed(2);
            break;

          case '/':
            input = (num1 / num2).toStringAsFixed(2);
            break;
        }

        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else {
      setState(() {
        input = input + buttonText;
      });
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue,
          onSurface: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              input,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: [
              buildButton('.'),
              buildButton('0'),
              buildButton('00'),     buildButton('+'),
        ],
      ),
      Row(
        children: [
          buildButton('CLEAR'),
          buildButton('='),
        ],
      ),
    ],
  ),
);
}
}
             
