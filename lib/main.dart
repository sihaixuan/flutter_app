import 'package:flutter/material.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/ShopListWidget.dart';
import 'package:flutter_app/entity/Product.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
//      title: 'Welcome to Flutter world!',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new RandomWords(),
//        ),
//      ),
     theme: new ThemeData(primaryColor: Colors.white) ,
      home: new ShopListWidget(products:<Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Chocolate chips'),
      ])
    );
  }
}