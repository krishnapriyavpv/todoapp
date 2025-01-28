import 'package:flutter/material.dart';

class MonitorScreen extends StatelessWidget {
  final List<Map<String, String>> accessList = [
    {
      'name': 'John',
      'relation': 'Son',
      'avatarUrl': 'assets/son_avatar.png',
      'icon': 'family'
    },
    {
      'name': 'Emma',
      'relation': 'Daughter',
      'avatarUrl': 'assets/daughter_avatar.png',
      'icon': 'family'
    },
    {
      'name': 'Mike',
      'relation': 'Son-in-law',
      'avatarUrl': 'assets/son_in_law_avatar.png',
      'icon': 'family_restroom'
    },
    {
      'name': 'Sophia',
      'relation': 'Daughter-in-law',
      'avatarUrl': 'assets/daughter_in_law_avatar.png',
      'icon': 'family_restroom'
    },
    {
      'name': 'David',
      'relation': 'Caretaker',
      'avatarUrl': 'assets/caretaker_avatar.png',
      'icon': 'person'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Access Monitor'),
        backgroundColor: Colors.deepPurple, // Add color to AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade50,
              Colors.blue.shade100
            ], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: accessList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5, // Added elevation for depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(accessList[index]['avatarUrl']!),
                      radius: 30,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Icon(
                          _getIconForRelation(accessList[index]['icon']!),
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  accessList[index]['name']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  accessList[index]['relation']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepPurple,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to get an icon based on the relation type
  IconData _getIconForRelation(String relation) {
    switch (relation) {
      case 'family':
        return Icons.family_restroom;
      case 'family_restroom':
        return Icons.people;
      case 'person':
        return Icons.person;
      default:
        return Icons.access_alarm; // Default icon if no match
    }
  }
}
