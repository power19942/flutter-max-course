import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/widgets/products/product_card.dart';
import '../../scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {

  Widget _buildProductList(List<Product> products) {
    Widget productCards = Center(
      child: Text("no data"),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) => ScopedModelDescendant<ProductsModel>(
    builder: (BuildContext context,Widget child,ProductsModel model) 
      => _buildProductList(model.products)
  );
}
