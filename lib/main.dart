import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CalC());

class CalC extends StatefulWidget {
  @override
  _CalCState createState() => _CalCState();
}

class _CalCState extends State<CalC> {
  String initial = '0';
  String firstInput = '0';
  String nextInput;
  String answer = '0';
  bool initialHasValue = false;
  String operand = '';

  double add(String x, String y) {
    return double.parse(x) + double.parse(y);
  }

  double sub(String x, String y) {
    return double.parse(x) - double.parse(y);
  }

  double mul(String x, String y) {
    return double.parse(x) * double.parse(y);
  }

  double div(String x, String y) {
    return double.parse(x) / double.parse(y);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Blinker'),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Container(
                          child: Text(
                            initial,
                            style: TextStyle(fontSize: 85.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: 'AC',
                            color: Color(0xFFF27E3F),
                            onTap: () {
                              setState(() {
                                initial = '0';
                                firstInput = '0';
                                answer = '0';
                                initialHasValue = false;
                                operand = '';
                              });
                            },
                          ),
                          CalCButton(
                            text: '+-',
                            color: Color(0xFFF27E3F),
                          ),
                          CalCButton(
                            text: '%',
                            color: Color(0xFFF27E3F),
                          ),
                          CalCButton(
                            text: '/',
                            color: Color(0xFFF27E3F),
                            onTap: () {
                              setState(() {
                                if (operand == '' || operand == '/') {
                                  if (firstInput == '0') {
                                    firstInput = initial;
                                    initial = '0';
                                    operand = '/';
                                  } else {
                                    nextInput = initial;
                                    double result = div(firstInput, nextInput);
                                    int floor = result.floor();
                                    print(floor);
                                    if (floor == result) {
                                      firstInput = floor.toString();
                                    } else {
                                      firstInput = result.toString();
                                    }
                                    initial = firstInput;
                                    print(initial);
                                    operand = '/';
                                    initialHasValue = true;
                                  }
                                } else if (operand == '+') {
                                  nextInput = initial;
                                  double result = add(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '/';
                                } else if (operand == '-') {
                                  nextInput = initial;
                                  double result = sub(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '/';
                                } else if (operand == 'x') {
                                  nextInput = initial;
                                  double result = mul(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '/';
                                }
                              });
                              //initial = '0';
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '7',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '7';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '7';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '8',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '8';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '8';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '9',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '9';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '9';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: 'x',
                            color: Color(0xFFF27E3F),
                            onTap: () {
                              setState(() {
                                if (operand == '' || operand == 'x') {
                                  if (firstInput == '0') {
                                    firstInput = initial;
                                    initial = '0';
                                    operand = 'x';
                                  } else {
                                    nextInput = initial;
                                    double result = mul(firstInput, nextInput);
                                    int floor = result.floor();
                                    print(floor);
                                    if (floor == result) {
                                      firstInput = floor.toString();
                                    } else {
                                      firstInput = result.toString();
                                    }
                                    initial = firstInput;
                                    print(initial);
                                    operand = 'x';
                                    initialHasValue = true;
                                  }
                                } else if (operand == '+') {
                                  nextInput = initial;
                                  double result = add(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = 'x';
                                } else if (operand == '-') {
                                  nextInput = initial;
                                  double result = sub(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = 'x';
                                } else if (operand == '/') {
                                  nextInput = initial;
                                  double result = div(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = 'x';
                                }
                              });
                              //initial = '0';
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '4',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '4';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '4';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '5',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '5';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '5';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '6',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '6';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '6';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '-',
                            color: Color(0xFFF27E3F),
                            onTap: () {
                              setState(() {
                                if (operand == '' || operand == '-') {
                                  if (firstInput == '0') {
                                    firstInput = initial;
                                    initial = '0';
                                    operand = '-';
                                  } else {
                                    nextInput = initial;
                                    double result = sub(firstInput, nextInput);
                                    int floor = result.floor();
                                    print(floor);
                                    if (floor == result) {
                                      firstInput = floor.toString();
                                    } else {
                                      firstInput = result.toString();
                                    }
                                    initial = firstInput;
                                    print('Initial : $initial');
                                    print('firstInput : $firstInput');
                                    initialHasValue = true;
                                    operand = '-';
                                  }
                                } else if (operand == '+') {
                                  nextInput = initial;
                                  double result = add(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  print('Initial : $initial');
                                  print('firstInput : $firstInput');
                                  operand = '-';
                                } else if (operand == 'x') {
                                  nextInput = initial;
                                  double result = mul(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '-';
                                } else if (operand == '/') {
                                  nextInput = initial;
                                  double result = div(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '-';
                                }
                              });
                              //initial = '0';
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '1',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '1';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '1';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '2',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '2';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '2';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '3',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '3';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '3';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '+',
                            color: Color(0xFFF27E3F),
                            onTap: () {
                              setState(() {
                                if (operand == '' || operand == '+') {
                                  if (firstInput == '0') {
                                    firstInput = initial;
                                    initial = '0';
                                    operand = '+';
                                  } else {
                                    nextInput = initial;
                                    double result = add(firstInput, nextInput);
                                    int floor = result.floor();
                                    print(floor);
                                    if (floor == result) {
                                      firstInput = floor.toString();
                                    } else {
                                      firstInput = result.toString();
                                    }
                                    initial = firstInput;
                                    print('Initial : $initial');
                                    print('firstInput : $firstInput');
                                    initialHasValue = true;
                                    operand = '+';
                                    print(operand);
                                  }
                                } else if (operand == '-') {
                                  nextInput = initial;
                                  double result = sub(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '+';
                                } else if (operand == 'x') {
                                  nextInput = initial;
                                  double result = mul(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '+';
                                } else if (operand == '/') {
                                  nextInput = initial;
                                  double result = div(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '+';
                                }
                              });
                              //initial = '0';
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '0',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '0';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '0';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: '.',
                            color: Color(0xFF696969),
                            onTap: () {
                              setState(() {
                                if (initial == '0') {
                                  initial = '.';
                                } else {
                                  if (initial == firstInput) {
                                    initial = '';
                                  }
                                  initial = initial + '.';
                                }
                              });
                            },
                          ),
                          CalCButton(
                            text: 'x',
                            color: Color(0xFFF27E3F),
                          ),
                          RawMaterialButton(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            splashColor: Color(0xFF696969),
                            fillColor: Color(0xFFF27E3F),
                            constraints: BoxConstraints.tightFor(
                                width: 80.0, height: 80.0),
                            child: Text(
                              '=',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                if (operand == '+') {
                                  nextInput = initial;
                                  double result = add(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '';
                                } else if (operand == '-') {
                                  nextInput = initial;
                                  double result = sub(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '';
                                } else if (operand == 'x') {
                                  nextInput = initial;
                                  double result = mul(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '';
                                } else if (operand == '/') {
                                  nextInput = initial;
                                  double result = div(firstInput, nextInput);
                                  int floor = result.floor();
                                  print(floor);
                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;
                                  operand = '';
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalCButton extends StatelessWidget {
  CalCButton({this.text, this.color, this.onTap});
  final String text;
  final Color color;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: Color(0xFFF27E3F),
      constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 40, color: color),
      ),
      onPressed: onTap,
    );
  }
}
