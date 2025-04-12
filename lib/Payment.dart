import 'dart:convert';

import 'package:demo/CommonWidget/APIConst.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;


class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final icons =[Icons.payment,Icons.money];
  
  String? selectedPaymentMethod;
  String? data;
  String? userID;
  String? serviceID;
  List<dynamic> payment = [];
  bool isLoading = false;
  var userData;

  void getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();

    setState(() {
      userID = setpreference.getString('uid');
      isLoading = true;
    });
    var url = Uri.parse("${ApiConst.base_url}user/fetch_booking.php");
    var response = await http.post(
      url,
      headers: {'cookie': ApiConst.cookie, 'User-Agent': ApiConst.user_agent},
      body: {'user_id':  userID,},
    );
    print(response.body);
    var decodedData = jsonDecode(response.body);
    setState(() {
      payment = decodedData['data'] ?? [];
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment methods"),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      )
          : payment.isNotEmpty ? ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: payment.length,
        itemBuilder: (context,index){
          return ListTile(
            leading:Icon(icons[index]),
            title: Text(payment[index]),
            onTap: (){
              setState(() {
                selectedPaymentMethod =payment[index];
              });
            },
          );
        }
      ):Center(
          child: Text("No payment available",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold))),
    );
  }
}