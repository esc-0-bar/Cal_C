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
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
                          ),
                          Card(
                            elevation: 5,
                            child: RawMaterialButton(onPressed: null),
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
