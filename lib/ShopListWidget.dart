import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ShopListItemWidget.dart';
import 'package:flutter_app/entity/Product.dart';

class ShopListWidget extends StatefulWidget{

  final List<Product> products;

  ShopListWidget({Key key,this.products}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return new _ShopListWidgetState();
  }

}

class _ShopListWidgetState extends State<ShopListWidget>{

  Set<Product> _shoppingCart = new Set();


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shoping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ShopListItemWidget(
            product: product,
            isCard: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: _addProduct,
      ),
    );
  }

  void _addProduct(){

    setState(() {
      WordPair wordPair = new WordPair.random();
      widget.products.add(new Product(name: wordPair.asPascalCase));
    });
  }
  
  void _handleCartChanged(Product product,bool isCart){
    setState(() {
      if(isCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }
}