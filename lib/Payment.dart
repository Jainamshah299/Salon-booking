import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final payment =["Online","Cash"];
  final icons =[Icons.payment,Icons.money];
  
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment methods"),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}