import 'package:calculatorApp/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var expression = "";
  var ans = "";

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    'ANS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      expression,
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(ans,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)))
              ],
            ),
          )),
          Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          // Clear
                          if (index == 0) {
                            return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  expression = "";
                                  ans = "";
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.green,
                              textColor: Colors.white,
                            );
                          }
                          // delete button
                          else if (index == 1) {
                            return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  expression = expression.substring(
                                      0, expression.length - 1);
                                  ans = "";
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                          // Result
                          else if (index == buttons.length - 1) {
                            return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  String userInput = expression;
                                  userInput = userInput.replaceAll('x', '*');
                                  Parser p = Parser();
                                  Expression exp = p.parse(userInput);
                                  ContextModel cm = ContextModel();
                                  double eval =
                                      exp.evaluate(EvaluationType.REAL, cm);
                                  ans = eval.toString();
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                            );
                          } else {
                            return MyButton(
                              buttonTapped: () {
                                if (expression != "" &&
                                    isOperator(buttons[index]) &&
                                    isOperator(
                                        expression[expression.length - 1])) {
                                  if (!isOperator(buttons[index])) {
                                    setState(() {
                                      expression += buttons[index];
                                    });
                                  }
                                } else if (expression != "") {
                                  if (buttons[index] == '.' &&
                                      expression[expression.length - 1] ==
                                          '.') {
                                    if (buttons[index] != '.') {
                                      setState(() {
                                        expression += buttons[index];
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      expression += buttons[index];
                                    });
                                  }
                                } else if (expression == "") {
                                  if (!isOperator(buttons[index])) {
                                    setState(() {
                                      expression += buttons[index];
                                    });
                                  }
                                }
                              },
                              buttonText: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.deepPurple
                                  : Colors.deepPurple[50],
                              textColor: isOperator(buttons[index])
                                  ? Colors.white
                                  : Colors.deepPurple,
                            );
                          }
                        }),
                  )))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == "/" ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == 'ANS') {
      return true;
    }
    return false;
  }
}
