import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../entity/weather.dart';

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
            _buildRow('temperature.png', "Temperature", widget._weather.temperature.toString()),
            _buildRow('precipitation.png', "Precipitation", widget._weather.precipitation.toString()),
            _buildRow('humidity.png', "Humidity", widget._weather.humidity.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String imageName, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/$imageName',
            width: 50,
            height: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$title: $value',
            style: TextStyle(fontSize: 28, fontFamily: 'Times New Roman'),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
