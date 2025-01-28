import 'package:flutter/material.dart';

class MemoryGameScreen extends StatelessWidget {
  final List<String> riddles = [
    'I speak without a mouth and hear without ears. What am I?',
    'I have keys but no locks. What am I?',
    'The more of me you take, the more you leave behind. What am I?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memory Games')),
      body: ListView.builder(
        itemCount: riddles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(riddles[index]),
          );
        },
      ),
    );
  }
}
