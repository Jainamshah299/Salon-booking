import 'package:demo/Admin/complain.dart';
import 'package:demo/Admin/history.dart';
import 'package:demo/Admin/salon.dart';
import 'package:demo/Admin/user.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final title=["About us","Logout"];
  final icon=[Icons.info_outline,Icons.logout];
  final container=[
    {
    'name': 'User',
    'description': 'ADD SALON NAME, ADDRESS',
    'color': Colors.pink.shade100,
    'route':userscreen(),
  },
    {
      'name': 'Salon',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': salonscreen(),
    },
    {
      'name': 'Booking history',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': historyscreen(),
    },
    {
      'name': 'Complain',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': complainscreen(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADMIN"),),
      body: Scaffold(

      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListView.builder(
                itemCount:title.length,
                itemBuilder:(context,index){
                  return ListTile(
                    leading: Icon(icon[index]),
                    title: Text(title[index]),

                  );

            } )

          ],
        ),
      ),


    );
  }
}
