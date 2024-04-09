class Weather {

  final String time;
  final String date;
  final String humidity;
  final String precipitation;
  final String temperature;

  Weather ({
    required this.time,
    required this.date,
    required this.humidity,
    required this.precipitation,
    required this.temperature
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    time: json['time'],
    date: json['date'],
    humidity: json['humidity'],
    precipitation: json['precipitation'],
    temperature: json['temperature']
  );

}