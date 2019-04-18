import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_app/pages/auth.dart';
import 'package:max_app/pages/product.dart';
import 'package:max_app/pages/product_admin.dart';
import 'package:max_app/pages/products.dart';

final _platformChannel = MethodChannel('flutter-course.com/battery');
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _platformChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level is $result %.';
    } catch (error) {
      batteryLevel = 'Failed to get battery level.';
      print(error);
    }
    print(batteryLevel);
  }
void main() {
  //_getBatteryLevel();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();

}
  
class _MyAppState extends State<MyApp>{  
  final List<Map<String,String>> _products = [];

  void _addProducts(Map<String,String> product){
    setState(() {
     _products.add(product); 
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepPurple,
        brightness: Brightness.light
      ),
      // home: AuthPage(),
      routes:{
        '/':(BuildContext context)=> ProductsPage(_products,_addProducts,_deleteProduct),
        '/admin':(BuildContext context)=> ProductsAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');
        print("pathElement is : ");
        print(pathElements.toString());
        if (pathElements[0]!=''){
          return null;
        }
        if (pathElements[1]=='product'){
          final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(builder: (context) 
               => ProductPage(_products[index]['title'],_products[index]['image']));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute<bool>(builder: (context) => ProductsPage(_products,_addProducts,_deleteProduct));
      }
    );
  }
}
