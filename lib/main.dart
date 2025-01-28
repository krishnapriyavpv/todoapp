import 'package:flutter/material.dart';
import 'screens/memory_game_screen.dart';
import 'screens/reminders_screen.dart';
import 'screens/carepal_screen.dart';
import 'screens/songs_screen.dart';
import 'screens/gps_tracking_screen.dart';
import 'screens/chatpal_screen.dart';

void main() {
  runApp(AlzPalApp());
}

class AlzPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlzPal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Memory Games', 'icon': Icons.memory, 'screen': MemoryGameScreen()},
    {'title': 'Reminders', 'icon': Icons.notifications, 'screen': RemindersScreen()},
    {'title': 'CarePal', 'icon': Icons.medical_services, 'screen': CarePalScreen()},
    {'title': 'Songs', 'icon': Icons.music_note, 'screen': SongsScreen()},
    {'title': 'GPS Tracking', 'icon': Icons.gps_fixed, 'screen': GPSTrackingScreen()},
    {'title': 'ChatPal', 'icon': Icons.chat, 'screen': ChatPalScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlzPal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => features[index]['screen']),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(features[index]['icon'], size: 40, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      features[index]['title'],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
