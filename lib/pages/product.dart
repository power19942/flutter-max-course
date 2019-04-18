import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

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
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              SizedBox(
                height: 10,
              ),
              Text(title),
              FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Delete"),
                  onPressed:()=>  _showWarningDialog(context)
              )
            ],
          )),
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
