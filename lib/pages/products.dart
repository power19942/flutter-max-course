import 'package:flutter/material.dart';
import 'package:max_app/scoped_models/main.dart';
import 'package:max_app/widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatelessWidget {
  _buildDrawer(context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          title: Text("Options"),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text("Manage Products"),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/admin');
          },
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Auth"),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        )
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
            ScopedModelDescendant<MainModel>(
              builder: (context,child,model) {
                return IconButton(
                  icon: Icon(model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    model.toggleDisplayMode();
                  },
                );
              },
            )
          ],
        ),
        drawer: _buildDrawer(context),
        body: Products());
  }
}
