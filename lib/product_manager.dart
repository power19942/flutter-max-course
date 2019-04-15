import 'package:flutter/material.dart';
import 'package:max_app/products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager(this.startingProduct);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text("Add Product"),
            onPressed: () {
              setState(() {
                _products.add("new Product");
              });
            },
          ),
        ),
        Products(_products)
      ],
    );
  }
}
