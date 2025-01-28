import 'package:flutter/material.dart';

class SongsScreen extends StatelessWidget {
  final List<String> songs = [
    'Calm Piano - 3:45',
    'Relaxing Guitar - 4:15',
    'Nature Sounds - 5:20',
    'Soft Jazz - 2:50',
    'Meditation Melody - 6:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Songs')),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]),
          );
        },
      ),
    );
  }
}
