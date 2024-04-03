import 'dart:convert';
import 'package:http/http.dart' as http;
import 'date.dart';
import 'weather.dart';

Future<Weather> fetchWeatherPrediction(String date) async {
  final response = await http.get(Uri.parse('http://192.168.88.38:5000/predict_weather?date=$date'));

  print('Статус-код відповіді: ${response.statusCode}');

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch weather prediction');
  }
}