import 'package:http/http.dart' as http;

class Date {
  final String date;

  Date({required this.date}); 

  factory Date.fromJson(Map<String, dynamic> json) => Date (
      date: json['date']
  );

}

