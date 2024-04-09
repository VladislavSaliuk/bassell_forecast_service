import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/forecast_page.dart';

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
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

