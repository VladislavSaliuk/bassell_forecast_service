import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);
  
  @override
  _DatePickerState createState() => _DatePickerState();
  
}

class _DatePickerState extends State<DatePicker> {

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text (
            "${_dateTime.day.toString()}.${_dateTime.month.toString().padLeft(2, '0')}.${_dateTime.year.toString()}",
            style: TextStyle(
              fontSize: 30
            ),),   

            MaterialButton(
              onPressed: _showDatePicker ,
              child: const Padding(
               padding: EdgeInsets.all(20.0),
                child: Text("Choose Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                  )
                )
              ),
              color: Colors.blue,
            ),
          ]
        ),
      )
    );
  }
}