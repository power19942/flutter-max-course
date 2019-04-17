import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_app/pages/home.dart';

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
  _getBatteryLevel();
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
