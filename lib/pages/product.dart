import 'package:flutter/material.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/scoped_models/main.dart';
import 'package:max_app/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {

  final int productIndex;

  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are You Sure"),
            content: Text("this action cannot be undone"),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("Cancle"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ScopedModelDescendant<MainModel>( 
        builder: (context,child,model){
          final Product product = model.products[productIndex];
          return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.image),
              SizedBox(
                height: 10,
              ),
              TitleDefault(product.title),
              FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Delete"),
                  onPressed:()=>  _showWarningDialog(context)
              )
            ],
          ));
        },
      ),
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
