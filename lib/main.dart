import 'package:flutter/material.dart';

void main() => runApp(CalC());

class CalC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Container(
                        child: Text(
                          '30',
                          style: TextStyle(fontSize: 75.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
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
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '7',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '8',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '9',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: 'x',
                            color: Color(0xFFF27E3F),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '4',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '5',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '6',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '-',
                            color: Color(0xFFF27E3F),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '1',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '2',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '3',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '+',
                            color: Color(0xFFF27E3F),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalCButton(
                            text: '0',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: '.',
                            color: Color(0xFF696969),
                          ),
                          CalCButton(
                            text: 'x',
                            color: Color(0xFFF27E3F),
                          ),
                          CalCButton(
                            text: '=',
                            color: Color(0xFFF27E3F),
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
  CalCButton({this.text, this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: Color(0xFFF27E3F),
      constraints: BoxConstraints.tightFor(width: 70.0, height: 70.0),
      //fillColor: Color(0xFF696969),
      child: Text(
        text,
        style: TextStyle(fontSize: 40, color: color),
      ),
      onPressed: () {},
    );
  }
}
