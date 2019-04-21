import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  _buildEditButton(context, index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductEditPage(
            product: products[index],
            updateProduct: updateProduct,
            index: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(products[index].title),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart)
                deleteProduct(index);
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index].image),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text('\$${products[index].price.toString()}'),
                  trailing: _buildEditButton(context, index),
                ),
                Divider()
              ],
            ));
      },
    );
  }
}
