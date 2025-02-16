import 'package:demo/dashboard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            ListTile(leading: Icon(Icons.settings),title:Text("setting "))
          ],
        ),
      )



    );
  }
}



