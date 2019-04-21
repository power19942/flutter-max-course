import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/widgets/products/products.dart';

class ProductsPage extends StatelessWidget{
  final List<Product> products;

  ProductsPage(this.products);

  _buildDrawer(context){
    return Drawer(
            child: Column(
            children: <Widget>[
              AppBar(
                title: Text("Options"),automaticallyImplyLeading: false,
                ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Manage Products"),onTap: (){
                Navigator.pushReplacementNamed(context, '/admin');
              },),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Auth"),onTap: (){
                Navigator.pushReplacementNamed(context, '/auth');
              },)
            ],
          ));
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("EasyList"),
            centerTitle: true,
            actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: (){},
                  )
              ],
          ),
          drawer: _buildDrawer(context),
          body: Products(products));
  }

}