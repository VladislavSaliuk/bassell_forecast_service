import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'api.dart';
import 'dart:convert';
import 'date.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  Future<Date?>? date;  

  DateTime _dateTime = DateTime.now();

  TextEditingController _dateController = TextEditingController();

  void _showDatePicker() async {
   DateTime? _picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100),
    );

    if(_picked != null) {
      setState(() {
        _dateTime = _picked;
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Transform.translate(
              offset: Offset(0,0),
              child: Image.asset(
                'assets/cloudy.png',
                 height: 130,
                 width: 130,  
              )
            ),
            
            Transform.translate(
              offset: Offset(0,-80),
              child: Text (
              'Bassell weather forecaster',
               style: 
                  TextStyle (
                    fontSize: 28,
                    fontFamily: 'Times New Roman'
                  ) 
              )
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
                    borderSide: BorderSide.none 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _showDatePicker();
                },
              ),
            ),
          ),


            Transform.translate(
              offset: Offset(0,50),
              child: MaterialButton (
                  onPressed: () => fetchWeatherPrediction(_dateController.text),
                  child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Forecast",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Times New Roman',
                     )
                  )
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), 
                ),
              ),
            ),  
          ]

        ),
      )
    );
  }
}