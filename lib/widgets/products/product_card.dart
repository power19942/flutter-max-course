import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/widgets/products/price_tag.dart';
import 'package:max_app/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard(this.product, this.index);

  _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 8,
          ),
          PriceTag(product.price.toString()),
        ],
      ),
    );
  }

  _buildActionButtons(context) {
    return ButtonBar(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString())
                .then((bool val) {
              if (val) {}
            });
          },
        ),
        ScopedModelDescendant<ProductsModel>(
          builder: (context, child, model) {
            return IconButton(
              icon: Icon(model.products[index].isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              onPressed:(){
                model.selectProduct(index);
                model.toggleProductFavoriteStatus();
              },
            );
          },
        )
      ],
      alignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
              child: Text('union square, san fransisco'),
            ),
          ),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
