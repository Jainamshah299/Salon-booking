import 'package:flutter/material.dart';

class historyscreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookingHistory = [
    {
      'username': 'Rahil',
      'salonName': 'Luxury Salon & Spa',
      'service': 'Haircut & Styling',
      'date': 'March 15, 2025',
      'time': '10:30 AM',
      'status': 'Completed',
    },
    {
      'username': 'Sahil',
      'salonName': 'Elite Beauty Hub',
      'service': 'Facial Treatment',
      'date': 'March 20, 2025',
      'time': '2:00 PM',
      'status': 'Pending',
    },
    {
      'username': 'Ajay',
      'salonName': 'Glamour Touch',
      'service': 'Manicure & Pedicure',
      'date': 'March 22, 2025',
      'time': '4:00 PM',
      'status': 'Canceled',
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking History")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bookingHistory.length,
        itemBuilder: (context, index) {
          final booking = bookingHistory[index];

          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                "${booking['username']}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text("${booking['salonName']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text("Service: ${booking['service']}"),
                  Text("Date: ${booking['date']}"),
                  Text("Time: ${booking['time']}"),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.circle, color: _getStatusColor(booking['status']), size: 12),
                      SizedBox(width: 6),
                      Text(
                        booking['status'],
                        style: TextStyle(color: _getStatusColor(booking['status']), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Booking Details"),
                    content: Text(
                      "User:${booking['username']}\n"
                      "Salon: ${booking['salonName']}\n"
                          "Service: ${booking['service']}\n"
                          "Date: ${booking['date']}\n"
                          "Time: ${booking['time']}\n"
                          "Status: ${booking['status']}",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
