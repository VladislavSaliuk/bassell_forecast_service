class Weather {

  final String date;
  final double humidity;
  final double precipitation;
  final double temperature;

  Weather ({
    required this.date,
    required this.humidity,
    required this.precipitation,
    required this.temperature
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    date: json['date'],
    humidity: json['humidity'],
    precipitation: json['precipitation'],
    temperature: json['temperature']
  );

}