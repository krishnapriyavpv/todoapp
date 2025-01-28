import 'package:flutter/material.dart';

class ChatPalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatPal')),
      body: Center(
        child: Text(
          'ChatPal connects you to caregivers and family members.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
