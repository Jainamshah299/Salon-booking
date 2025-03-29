import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class userscreen extends StatefulWidget {
  const userscreen({super.key});

  @override
  State<userscreen> createState() => _userscreenState();
}

class _userscreenState extends State<userscreen> {
  final name = ["Shah", "Sharma", "Desai"];
  final email = ["shah@123gmail.com", "sharma11@gmail.com", "desai@gmail.com"];
  final number = ["1234567890", "9876543210", "9354678653"];

  // Join time in 'dd-MM-yyyy HH:mm' format using DateTime.now()
  final joined = [
    DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now().subtract(Duration(days: 2))),
    DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now().subtract(Duration(days: 5))),
    DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now().subtract(Duration(days: 10))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Users"),
        backgroundColor: Colors.white54,
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: Text(
                  name[index][0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              title: Text(
                name[index],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${email[index]}", style: const TextStyle(color: Colors.grey)),
                  Text("Number: ${number[index]}", style: const TextStyle(color: Colors.grey)),
                  Text("Joined: ${joined[index]}", style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
