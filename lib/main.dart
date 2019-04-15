import 'package:flutter/material.dart';
import 'package:max_app/product_manager.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("EasyList"),
            centerTitle: true,
          ),
          body: ProductManager("Food Teaster")),
    );
  }
}
