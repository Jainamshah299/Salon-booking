
import 'package:demo/Admin/AdminDashboardPage.dart';
import 'package:demo/SalonDetailPage.dart';
import 'package:demo/Salon_Manager/SalonManagerDashboard.dart';
import 'package:demo/Slotbook.dart';
import 'package:demo/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:demo/loginScreen.dart';
import 'package:demo/Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Salonmanagerdashboard(),
        );
  }
}
