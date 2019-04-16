import 'package:flutter/material.dart';
import 'package:max_app/pages/home.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepPurple,
        brightness: Brightness.light
      ),
      home: HomePage()
    );
  }
}
