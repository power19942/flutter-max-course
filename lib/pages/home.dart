import 'package:flutter/material.dart';
import 'package:max_app/product_manager.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("EasyList"),
            centerTitle: true,
          ),
          body: ProductManager());
  }

}