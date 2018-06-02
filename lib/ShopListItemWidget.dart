import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/entity/Product.dart';


typedef void CartChangedCallback(Product product,bool isCart);

class ShopListItemWidget extends StatelessWidget{

  final Product product;
  final bool isCard;
  final CartChangedCallback onCartChanged;

  ShopListItemWidget({Product product,this.isCard,this.onCartChanged})
      :product = product,
      super(key:new ObjectKey(product));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: (){
        onCartChanged(product,!isCard);
      },
      leading: new CircleAvatar(
        child: new Text(product.name[0]),
        backgroundColor: _getColor(context),
      ),
      title: new Text(product.name,style: _getTextStyle(context),),
    );
  }

  Color _getColor(BuildContext context){
    return isCard ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    return isCard ? new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    ): null;
  }

}