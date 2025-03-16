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
    'route': Detailscreen(),
  },
    {
      'name': 'Salon',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': Detailscreen(),
    },
    {
      'name': 'Booking history',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': Detailscreen(),
    },
    {
      'name': 'Complain',
      'description': 'ADD SALON NAME, ADDRESS',
      'color': Colors.pink.shade100,
      'route': Detailscreen(),
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
