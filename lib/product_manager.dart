import 'package:flutter/material.dart';
import 'package:max_app/products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager({this.startingProduct = "Food Teaster"});

  @override
  State<StatefulWidget> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  final List<String> _products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _products.add(widget.startingProduct);
  }

  void _addProducts(String product){
    setState(() {
     _products.add(product); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: ProductControl(_addProducts) ,
        ),
        Products(_products)
      ],
    );
  }
}
