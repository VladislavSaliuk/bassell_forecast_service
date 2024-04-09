import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/weather.dart';

Future<Weather> fetchWeatherPrediction(String time, String date) async {
  final response = await http.get(Uri.parse('http://192.168.88.38:5000/predict_weather?time=$time&date=$date'));

  print('Status: ${response.statusCode}');

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch weather prediction');
  }
}