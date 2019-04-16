import 'package:flutter/material.dart';
import 'package:max_app/pages/product.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {}

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/food.jpg"),
          Text(products[index]),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return ProductPage();
                  }));
                },
              )
            ],
            alignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard = Center(
      child: Text("no data"),
    );
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) => _buildProductList();
}
