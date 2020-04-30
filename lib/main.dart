import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(CalC());

class CalC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Blinker'),
        home: CalCs());
  }
}

class CalCs extends StatefulWidget {
  @override
  _CalCsState createState() => _CalCsState();
}

class _CalCsState extends State<CalCs> {
  String initial = '0';
  String firstInput = '0';
  String nextInput;
  String answer = '0';
  bool initialHasValue = false;
  String operand = '';
  String sign = '+';

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
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Color(0xFFF27E3F),
            ),
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.none,
                title: "Cal C",
                desc: "A Tribute to Roll No One Raj.",
                buttons: [
                  DialogButton(
                    child: Text(
                      "COOL",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Color(0xFFF27E3F),
                    radius: BorderRadius.circular(0.0),
                  ),
                ],
              ).show();
            },
          ),
        ],
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
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
              flex: 3,
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
                          onTap: () {
                            setState(() {
                              if (sign == '+') {
                                initial = '-' + initial;
                                sign = '-';
                              } else if (sign == '-') {
                                initial = initial.substring(1, initial.length);
                                sign = '+';
                              }
                            });
                          },
                        ),
                        CalCButton(
                          text: '%',
                          color: Color(0xFFF27E3F),
                          onTap: () {
                            setState(() {
                              int floor = (double.parse(initial) / 100).floor();
                              if (floor == double.parse(initial)) {
                                initial = floor.toString();
                              } else {
                                initial =
                                    (double.parse(initial) / 100).toString();
                              }
                            });
                          },
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

                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;

                                  operand = '/';
                                  initialHasValue = true;
                                }
                              } else if (operand == '+') {
                                nextInput = initial;
                                double result = add(firstInput, nextInput);
                                int floor = result.floor();

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

                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;

                                  operand = 'x';
                                  initialHasValue = true;
                                }
                              } else if (operand == '+') {
                                nextInput = initial;
                                double result = add(firstInput, nextInput);
                                int floor = result.floor();

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

                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;

                                  initialHasValue = true;
                                  operand = '-';
                                }
                              } else if (operand == '+') {
                                nextInput = initial;
                                double result = add(firstInput, nextInput);
                                int floor = result.floor();

                                if (floor == result) {
                                  firstInput = floor.toString();
                                } else {
                                  firstInput = result.toString();
                                }
                                initial = firstInput;

                                operand = '-';
                              } else if (operand == 'x') {
                                nextInput = initial;
                                double result = mul(firstInput, nextInput);
                                int floor = result.floor();

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

                                  if (floor == result) {
                                    firstInput = floor.toString();
                                  } else {
                                    firstInput = result.toString();
                                  }
                                  initial = firstInput;

                                  initialHasValue = true;
                                  operand = '+';
                                }
                              } else if (operand == '-') {
                                nextInput = initial;
                                double result = sub(firstInput, nextInput);
                                int floor = result.floor();

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
                        RawMaterialButton(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            splashColor: Color(0xFFF27E3F),
                            constraints: BoxConstraints.tightFor(
                                width: 80.0, height: 80.0),
                            child: Icon(
                              Icons.backspace,
                              color: Color(0xFFF27E3F),
                            ),
                            onPressed: () {
                              setState(() {
                                if (initial.length != 0) {
                                  initial =
                                      initial.substring(0, initial.length - 1);
                                }
                              });
                            }),
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
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if (operand == '+') {
                                nextInput = initial;
                                double result = add(firstInput, nextInput);
                                int floor = result.floor();

                                if (floor == result) {
                                  firstInput = floor.toString();
                                } else {
                                  firstInput = result.toString();
                                }
                                initial = firstInput;
                                operand = '';
                                firstInput = '0';
                              } else if (operand == '-') {
                                nextInput = initial;
                                double result = sub(firstInput, nextInput);
                                int floor = result.floor();

                                if (floor == result) {
                                  firstInput = floor.toString();
                                } else {
                                  firstInput = result.toString();
                                }
                                initial = firstInput;
                                operand = '';
                                firstInput = '0';
                              } else if (operand == 'x') {
                                nextInput = initial;
                                double result = mul(firstInput, nextInput);
                                int floor = result.floor();

                                if (floor == result) {
                                  firstInput = floor.toString();
                                } else {
                                  firstInput = result.toString();
                                }
                                initial = firstInput;
                                operand = '';
                                firstInput = '0';
                              } else if (operand == '/') {
                                nextInput = initial;
                                double result = div(firstInput, nextInput);
                                int floor = result.floor();

                                if (floor == result) {
                                  firstInput = floor.toString();
                                } else {
                                  firstInput = result.toString();
                                }
                                initial = firstInput;
                                operand = '';
                                firstInput = '0';
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
    );
  }
}

class CalCButton extends StatelessWidget {
  CalCButton({this.text, this.color, this.onTap, this.icon});
  final String text;
  final Color color;
  final Function onTap;
  final Icon icon;
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
