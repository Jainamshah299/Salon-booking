import 'dart:convert';

import 'package:demo/CommonWidget/APIConst.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;

class salonappointment extends StatefulWidget {
  @override
  State<salonappointment> createState() => _salonappointmentState();
}

class _salonappointmentState extends State<salonappointment> {
  String? data;

  String? userID;

  String? serviceID;

  List<dynamic> booking = [];

  bool isLoading = false;

  var userData;

  void getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();

    setState(() {
      userID = setpreference.getString('uid');
      isLoading = true;
    });
    var url = Uri.parse("${ApiConst.base_url}salon/salon_fetch_booking.php");
    var response = await http.post(
      url,
      headers: {'cookie': ApiConst.cookie, 'User-Agent': ApiConst.user_agent},
      body: {'salon_id':  userID,},
    );
    print(response.body);
    var decodedData = jsonDecode(response.body);
    setState(() {
      booking = decodedData['bookings'] ?? [];
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salon Appointment'),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      )
          :ListView.builder(
        itemCount: booking.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(booking[index]['user_name']!),
              subtitle: Text('Service: ${booking[index]['service_name']}\nAmount: ${booking[index]['totalamount']}\nDate: ${booking[index]['timestamp']}'),
              trailing: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54 ,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(booking[index]['status'] == "0" ? "Pending" : booking[index]['status']),
              ),
            ),
          );
        },
      ),
    );
  }
}