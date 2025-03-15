import 'package:demo/FeedbackScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(appointment());
}

class appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingHistoryScreen(),
    );
  }
}

class BookingHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      'title':'Salon Name',
      'service': 'Haircut & Styling',
      'date': 'March 5, 2025',
      'time': '3:00 PM',
      'icon': Icons.cut,
      'status':"completed",
    },
    {
      'title':'Salon Name',
      'service': 'Facial Treatment',
      'date': 'March 2, 2025',
      'time': '1:30 PM',
      'icon': Icons.spa,
      'status':"pending",
    },
    {
      'title':'Salon Name',
      'service': 'Manicure & Pedicure',
      'date': 'February 28, 2025',
      'time': '11:00 AM',
      'icon': Icons.self_improvement,
      'status':"pending",
    },
    {
      'title':'Salon Name',
      'service': 'Hair Color',
      'date': 'February 25, 2025',
      'time': '2:00 PM',
      'icon': Icons.brush,
      'status':"pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(booking['icon'], color: Colors.pinkAccent, size: 30),
                title: Text(booking['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${booking['date']} • ${booking['time']}"),
                trailing: booking['status'] == "completed" ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackScreen(),
                      ),
                    );
                  },

                  child: Text("Give Feedback"),
                ):  booking['status'] == "pending" ? ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54 ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Pending"),
                ): null,
              ),
            );
          },
        ),
      ),
    );
  }
}


