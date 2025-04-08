import 'package:flutter/material.dart';

class salonscreen extends StatefulWidget {
  const salonscreen({super.key});

  @override
  State<salonscreen> createState() => _salonscreenState();
}

class _salonscreenState extends State<salonscreen> {
  final List<Map<String, String>> salons = [
    {
      "name": "Jawed Habib",
      "location": "MG Road, Delhi",
      "services": "Haircut, Styling, Facial",
      "contact": "9876543210",
      "joined": "March 2024",
    },
    {
      "name": "Broadway",
      "location": "Andheri West, Mumbai",
      "services": "Hair, Spa, Nails",
      "contact": "9123456780",
      "joined": "January 2025",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Salons")),
      body: ListView.builder(
        itemCount: salons.length,
        itemBuilder: (context, index) {
          final salon = salons[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Salon Name: ${salon['name']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Location: ${salon['location']}"),
                  Text("Services: ${salon['services']}"),
                  Text("Contact: ${salon['contact']}"),
                  Text("Joined: ${salon['joined']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
