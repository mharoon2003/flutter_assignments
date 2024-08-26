import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //fields of the program

  double fnumber = 0.0;
  double snumber = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideinput = false;
  var outputsize = 36.0;

  onButtonClick(data) {
    // if AC clicked
    if (data == 'AC') {
      output = '';
      operation = '';
      input = '';
    } else if (data == 'Delete') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (data == '=') {
      if (input.isNotEmpty) {
        var useri = input;
        Parser p = Parser();
        Expression expression = p.parse(useri);
        ContextModel cm = ContextModel();
        var lastvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = lastvalue.toString();
        input = output;
        hideinput = true;
        outputsize = 40;
      }
    } else {
      hideinput = false;
      outputsize = 34;
      input = input + data;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            ' Calculator App ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
        ),
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            //input output area

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      hideinput ? '' : input,
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      output,
                      style:
                          TextStyle(color: Colors.white, fontSize: outputsize),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            //Buttons area
            Row(
              children: [
                button(
                    text: 'AC',
                    tcolor: Colors.orangeAccent,
                    buttonbgcolor: Colors.grey[700]),
                button(
                    text: 'Delete',
                    tcolor: Colors.orangeAccent,
                    buttonbgcolor: Colors.grey[700]),
                button(text: '', buttonbgcolor: Colors.transparent),
                button(
                    text: '/',
                    buttonbgcolor: Colors.grey[700],
                    tcolor: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                button(text: '1'),
                button(text: '2'),
                button(
                  text: '3',
                ),
                button(
                    text: '*',
                    buttonbgcolor: Colors.grey[700],
                    tcolor: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                button(text: '4'),
                button(text: '5'),
                button(
                  text: '6',
                ),
                button(
                    text: '+',
                    buttonbgcolor: Colors.grey[700],
                    tcolor: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                button(text: '7'),
                button(text: '8'),
                button(
                  text: '9',
                ),
                button(
                    text: '-',
                    buttonbgcolor: Colors.grey[700],
                    tcolor: Colors.orangeAccent),
              ],
            ),
            Row(
              children: [
                button(text: '0'),
                button(text: '.'),
                button(
                    text: '=',
                    buttonbgcolor: Colors.green,
                    tcolor: Colors.orangeAccent),
                button(
                    text: '%',
                    buttonbgcolor: Colors.grey[700],
                    tcolor: Colors.orangeAccent),
              ],
            ),
          ],
        ));
  }

  Widget button({text, tcolor = Colors.white, buttonbgcolor = Colors.blueGrey}) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(3),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.red,
            backgroundColor: buttonbgcolor,
            padding: EdgeInsets.all(22),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          onPressed: () {
            onButtonClick(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: tcolor,
            ),
          )),
    ));
  }
}


