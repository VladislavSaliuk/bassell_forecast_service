import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'api.dart';
import 'weather.dart';

class ForecastPage extends StatefulWidget {
  late Weather _weather;

  set weather(Weather weather) {
    _weather = weather;
  }

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Temperature: ${widget._weather.temperature.toString()}',
              style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman'),
            ),
             Text(
              'Precipitation: ${widget._weather.precipitation.toString()}',
              style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman'),
            ),
             Text(
              'humidity: ${widget._weather.humidity.toString()}',
              style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman'),
            ),
          ],
        ),
      ),
    );
  }
}
