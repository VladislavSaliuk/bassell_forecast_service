import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  test('Test predict_weather route', () async {
    final response = await http.get(Uri.parse('http://192.168.88.38:5000/predict_weather?time=12:00&date=2024-04-01'));

    expect(response.statusCode, equals(200));
    
    final Map<String, dynamic> data = json.decode(response.body);
    expect(data.containsKey('temperature'), equals(true));
    expect(data.containsKey('precipitation'), equals(true));
    expect(data.containsKey('humidity'), equals(true));
  });
}
