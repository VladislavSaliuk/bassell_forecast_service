import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/weather.dart';
import '../api/api.dart';
import '../pages/forecast_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime _dateTime = DateTime.now();

  TimeOfDay _timeOfDay =  TimeOfDay.now();

  TextEditingController _dateController = TextEditingController();

  void _showDatePicker() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateTime = _picked;
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }



  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _timeOfDay = pickedTime;
        print(_timeOfDay.toString());
      });
    } else {
      throw Exception('No time selected');
    }
  }

void _navigateToForecastPage() async {
  try {
    await _showTimePicker(); 
    String formattedTime = '${_timeOfDay.hour}:${_timeOfDay.minute}';
    Weather weather = await fetchWeatherPrediction(formattedTime, _dateController.text);
    ForecastPage forecastPage = ForecastPage();
    forecastPage.weather = weather;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => forecastPage,
      ),
    );
  } catch (e) {
    print('Error fetching weather prediction: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.translate(
              offset: Offset(0, 0),
              child: Image.asset(
                'assets/cloudy.png',
                height: 130,
                width: 130,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -80),
              child: Text(
                'Bassell weather forecaster',
                style: TextStyle(fontSize: 28, fontFamily: 'Times New Roman'),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -70),
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'DATE',
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  readOnly: true,
                  onTap: () {
                    _showDatePicker();
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 50),
              child: MaterialButton(
                onPressed: _navigateToForecastPage,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Forecast",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                      )),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
