import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/scoped_models/main.dart';
import 'package:max_app/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {
  ScrollController ctrl;
  Products(){
    ctrl  = ScrollController();
    ctrl.addListener(() {
    if (ctrl.position.atEdge) {
      if (ctrl.position.pixels == 0)
        print("At extreme top");
      else
        print("At extreme bottom");
    }
    });
  }

  Widget _buildProductList(List<Product> products) {
    Widget productCards = Center(
      child: Text("no data"),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        //controller:ctrl ,
        itemBuilder: (BuildContext context, int index) =>ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) => ScopedModelDescendant<MainModel>(
    builder: (BuildContext context,Widget child,MainModel model) 
      => _buildProductList(model.displayedProducts)
  );
}
