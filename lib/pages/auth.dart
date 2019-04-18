import 'package:flutter/material.dart';
import 'package:max_app/pages/product_admin.dart';

class AuthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(child: RaisedButton(
        child: Text("Login"),
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/');
        },
      ),),
    );
  }
  
}