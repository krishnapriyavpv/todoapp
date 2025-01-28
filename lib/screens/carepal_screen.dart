import 'package:flutter/material.dart';

class CarePalScreen extends StatelessWidget {
  final List<String> tips = [
    'Keep a daily routine.',
    'Ensure the patient stays hydrated.',
    'Provide regular physical activity.',
    'Communicate calmly and clearly.',
    'Use reminders to support memory.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CarePal')),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tips[index]),
          );
        },
      ),
    );
  }
}
