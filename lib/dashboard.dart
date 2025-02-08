import 'package:flutter/material.dart';

void main() => runApp(SalonApp());

class SalonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
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
        )
    class BannerSection extends StatelessWidget {
    const BannerSection({Key? key}) : super(key: key)

    @override
    Widget build(BuildContext context) {
    return Container(
    height: 180,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    image: const DecorationImage(
    image: NetworkImage('https://via.placeholder.com/400x180'),
    fit: BoxFit.cover,
    ),
    ),
    child: Container(
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: LinearGradient(
    colors: [
    Colors.black.withOpacity(0.6),
    Colors.transparent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    ),
    ),
    child: const Text(
    'Exclusive Offers Just for You!',
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    );
    }
    }
      ,);

  }
}