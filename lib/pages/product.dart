import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail"),),
      body: Column(
        children: <Widget>[
          Center(child: Text("details page"),),
          FlatButton(child: Text("Back"),onPressed: ()=> Navigator.pop(context),)
        ],
      )
    );
  }

}