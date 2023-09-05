import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('This is an AlertDialog.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSimpleDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Option 2'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDatePickerDialog(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      print('Selected date: ${picked.toLocal()}');
  }

  Future<void> _showTimePickerDialog(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      print('Selected time: ${picked.format(context)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: Text('Show AlertDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSimpleDialog(context);
              },
              child: Text('Show SimpleDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showDatePickerDialog(context);
              },
              child: Text('Show DatePickerDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showTimePickerDialog(context);
              },
              child: Text('Show TimePickerDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
