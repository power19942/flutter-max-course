import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{
  final String title;
  final String imageUrl;

  ProductPage(this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          SizedBox(height: 10,),
          Text(title),
          FlatButton(color: Colors.red,textColor: Colors.white,child: Text("Delete"),
          onPressed: ()=> Navigator.pop(context,true),)
        ],
      )
    ),
    onWillPop: (){
      Navigator.pop(context,false);
      return Future.value(false);
    },
    );
  }

}