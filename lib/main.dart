import 'package:flutter/material.dart';
import 'home_page.dart';
import 'forecast_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/forecast_page': (context) => ForecastPage(),
      },
    );
  }
}

