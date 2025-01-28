import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  final List<String> reminders = [
    'Take medicine at 9 AM',
    'Visit doctor at 3 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        backgroundColor: Color(0xFF87CEEB), // Light Sky Blue
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Create Reminder Section
            Card(
              color: Color(0xFFFFF9C4), // Light Yellow
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.add_circle,
                        size: 40, color: Color(0xFF00BFA5)), // Teal Icon
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a new reminder...',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add reminder functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFD700), // Golden Yellow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Create',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Reminder List
            Expanded(
              child: ListView.builder(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFEAF1F8), // Light Blue Card
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      minTileHeight: 60,
                      leading: Icon(Icons.notifications,
                          color: Color(0xFF00BFA5), size: 30),
                      title: Text(
                        reminders[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333), // Dark Gray
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit,
                                color: Color(0xFFFFA726)), // Orange for Edit
                            onPressed: () {
                              // Edit functionality
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,
                                color: Color(0xFFD72638)), // Red for Delete
                            onPressed: () {
                              // Delete functionality
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
