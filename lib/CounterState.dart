import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/CouterWidget.dart';

class CounterState extends State<CounterWidget>{
  int _couter = 0;
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('increment'),
        ),
        new Text('Count : $_couter')
      ],
    );
  }

  void _increment(){
    setState(() {
      _couter++;
    });
  }

}