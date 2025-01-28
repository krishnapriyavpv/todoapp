import 'package:flutter/material.dart';

class GPSTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPS Tracking')),
      body: Center(
        child: Text(
          'Real-time GPS tracking is enabled.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
