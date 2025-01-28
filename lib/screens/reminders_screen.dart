import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  final List<String> reminders = ['Take medicine at 9 AM', 'Visit doctor at 3 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminders')),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reminders[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete functionality
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
