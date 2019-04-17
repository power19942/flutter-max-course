import 'package:flutter/material.dart';
import 'package:max_app/product_manager.dart';

class ProductsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("EasyList"),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Column(
            children: <Widget>[
              AppBar(title: Text("Options"),automaticallyImplyLeading: false),
              ListTile(title: Text("Manage Products"),onTap: (){},)
            ],
          ),),
          body: ProductManager());
  }

}