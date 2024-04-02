import 'dart:convert';
import 'package:http/http.dart' as http;
import 'date.dart';

Future<void> fetchWeatherPrediction(String date) async {
  final response = await http.get(Uri.parse('http://192.168.88.38:5000/predict_weather?date=$date'));

  print('Статус-код відповіді: ${response.statusCode}');

  if (response.statusCode == 200) {
    print('Weather prediction received: ${response.body}');
  } else {
    throw Exception('Failed to fetch weather prediction');
  }
}
