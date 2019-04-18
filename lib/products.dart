import 'package:flutter/material.dart';
import 'package:max_app/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function deleteProduct;

  Products(this.products,{this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () {
                  Navigator.pushNamed<bool>(context,'/product/'+index.toString()).then((bool val){
                    if(val){
                      deleteProduct(index);
                    }
                  });
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
