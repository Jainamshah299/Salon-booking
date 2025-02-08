import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpeg',
              height: 40,
              width: 40,
            ),
            Text(
              'Hair Heaven',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 20),
              _buildPromoBanner(),
              SizedBox(height: 20),
              _buildSectionTitle("Our Best Services"),
              _buildHorizontalList(["Men", "Women", "Kids"]),
              SizedBox(height: 20),
              _buildSectionTitle("Top  Rated Salons"),
              _buildHorizontalList(
                  ["Milan Jack", "Sujata Kumari", "Rahul Syi"]),
              SizedBox(height: 20),
              _buildAppointmentDateTime(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: "Appointment"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search services...",
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image:
          AssetImage('assets/promo_banner.jpg'), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          "Look Awesome & Save Time\nUp to 40% Off",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildHorizontalList(List<String> items) {
    return Container(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                items[index],
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppointmentDateTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Select Date"),
        SizedBox(height: 10),
        Row(
          children: [
            _buildDateCard("Sat 10"),
            SizedBox(width: 10),
            _buildDateCard("Sun 11"),
          ],
        ),
        SizedBox(height: 20),
        _buildSectionTitle("Select Time"),
        SizedBox(height: 10),
        Row(
          children: [
            _buildTimeCard("08:30 PM"),
            SizedBox(width: 10),
            _buildTimeCard("09:30 PM"),
          ],
        ),
      ],
    );
  }

  Widget _buildDateCard(String date) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(date)),
    );
  }

  Widget _buildTimeCard(String time) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(time)),
    );
  }
}
