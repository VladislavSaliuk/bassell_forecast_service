import 'package:flutter/material.dart';
import 'date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatePicker(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  } 

}
