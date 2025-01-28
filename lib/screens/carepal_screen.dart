import 'package:flutter/material.dart';

class CarePalScreen extends StatelessWidget {
  final List<Map<String, String>> careTips = [
    {
      'tip': 'Keep a daily routine.',
      'image': 'assets/images/routine.png', // Local asset path
    },
    {
      'tip': 'Ensure the patient stays hydrated.',
      'image': 'assets/images/hydrate.png', // Local asset path
    },
    {
      'tip': 'Provide regular physical activity.',
      'image': 'assets/images/build.png', // Local asset path
    },
    {
      'tip': 'Communicate calmly and clearly.',
      'image': 'assets/images/calm.png', // Local asset path
    },
    {
      'tip': 'Use reminders to support memory.',
      'image': 'assets/images/reminder.png', // Local asset path
    },
  ];

  final List<Map<String, String>> essentialInfo = [
    {
      'title': 'Medical History',
      'icon': 'medical_services',
      'color': '0xFF5B3C9B'
    },
    {'title': 'Emergency Contacts', 'icon': 'phone', 'color': '0xFF3A86FF'},
    {'title': 'Medications', 'icon': 'medication', 'color': '0xFF6D597A'},
    {'title': 'Allergies', 'icon': 'warning', 'color': '0xFFF4A261'},
    {'title': 'Next Appointment', 'icon': 'event', 'color': '0xFF2A9D8F'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CarePal'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Essential Information Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: essentialInfo.map((info) {
                  // Determine the appropriate icon
                  IconData icon;
                  switch (info['icon']) {
                    case 'medical_services':
                      icon = Icons.medical_services;
                      break;
                    case 'phone':
                      icon = Icons.phone;
                      break;
                    case 'medication':
                      icon = Icons.medication;
                      break;
                    case 'warning':
                      icon = Icons.warning;
                      break;
                    case 'event':
                      icon = Icons.event;
                      break;
                    default:
                      icon = Icons.help;
                  }

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Color(int.parse(info['color']!)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        icon,
                        color: Colors.white,
                      ),
                      title: Text(
                        info['title']!,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Care Tips Section in ListView
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Care Tips:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap:
                        true, // Prevent scrolling issues inside the column
                    itemCount: careTips.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "",
                                height: 300, // Set the height of the image
                                width: double
                                    .infinity, // Make the image cover the width of the card
                                fit: BoxFit
                                    .cover, // Ensures the image covers the area
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                careTips[index]['tip']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
