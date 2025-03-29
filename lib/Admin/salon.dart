import 'package:flutter/material.dart';

class salonscreen extends StatefulWidget {
  const salonscreen({super.key});

  @override
  State<salonscreen> createState() => _salonscreenState();
}

class _salonscreenState extends State<salonscreen> {
  final name=["Jawed Habib","broadway"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Salons"),),
      body: ListView.builder(
        itemCount:name.length ,
          itemBuilder: (context,index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("name: ${name[index]}")
                ],
              ),
            ),

          );
          }),

    );
  }
}
