import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_app/models/product.dart';
import 'package:max_app/pages/auth.dart';
import 'package:max_app/pages/product.dart';
import 'package:max_app/pages/product_admin.dart';
import 'package:max_app/pages/products.dart';
import 'package:max_app/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

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
  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();

}
  
class _MyAppState extends State<MyApp>{  
  
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepPurple,
        brightness: Brightness.light,
        buttonColor: Colors.deepPurple,
      ),
      // home: AuthPage(),
      routes:{
        '/':(BuildContext context)=> AuthPage(),
        '/products':(BuildContext context)=> ProductsPage(),
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
               => ProductPage(index));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute<bool>(builder: (context) => ProductsPage());
      }
    )
    );
  }
}
