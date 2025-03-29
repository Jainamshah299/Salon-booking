import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class salonappointment extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {'customer': 'Jay', 'service': 'Haircut', 'time': '10:00 AM', 'date': '2025-03-23'},
    {'customer': 'Smith', 'service': 'Facial', 'time': '11:30 AM', 'date': '2025-03-23'},
    {'customer': 'Rahul', 'service': 'Shaving', 'time': '1:00 PM', 'date': '2025-03-23'},
    {'customer': 'Rohan', 'service': 'Massage', 'time': '3:00 PM', 'date': '2025-03-23'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salon Dashboard'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(appointments[index]['customer']!),
              subtitle: Text('Service: ${appointments[index]['service']}\nTime: ${appointments[index]['time']}\nDate: ${appointments[index]['date']}'),
            ),
          );
        },
      ),
    );
  }
}