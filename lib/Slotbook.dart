import 'package:demo/Payment.dart';
import 'package:demo/dashboard.dart';
import 'package:flutter/material.dart';

class Slotbook extends StatefulWidget {
  @override
  _SlotbookState createState() => _SlotbookState();
}

class _SlotbookState extends State<Slotbook> {
  String? selectedStylist;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedPaymentMethod;

  final _formKey = GlobalKey<FormState>();
  String? cardNumber, expiryDate, cvv;

  // Function to validate inputs
  void _validateAndProceed() {
    if (selectedStylist == null || selectedDate == null || selectedTime == null || selectedPaymentMethod == null) {
      _showValidationPopup();
    } else if (selectedPaymentMethod == "Online" && !_formKey.currentState!.validate()) {
      _showValidationPopup(message: "Please enter valid card details.");
    } else {
      _showConfirmationPopup();
    }
  }

  // Function to show validation popup
  void _showValidationPopup({String message = "Please select all required details to proceed."}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Incomplete Information"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // Function to show confirmation popup
  void _showConfirmationPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Booking Confirmed!"),
        content: Text("Your appointment has been successfully booked."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardPage(),
                ),
              );
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 20),

                  _buildSelectionCard(
                    title: "Select Stylist",
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("Choose a stylist"),
                        value: selectedStylist,
                        items: ["Salim", "Ashim", "Alim", "Jawed"]
                            .map((stylist) => DropdownMenuItem(
                          value: stylist,
                          child: Text(stylist),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedStylist = value;
                          });
                        },
                      ),
                    ),
                  ),

                  _buildSelectionCard(
                    title: "Select Date",
                    child: TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 5)),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : "Select the date",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(Icons.calendar_today, color: Colors.purple),
                        ],
                      ),
                    ),
                  ),

                  _buildSelectionCard(
                    title: "Select Time",
                    child: TextButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedTime != null
                                ? selectedTime!.format(context)
                                : "Select the time",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(Icons.access_time, color: Colors.purple),
                        ],
                      ),
                    ),
                  ),

                  _buildSelectionCard(
                    title: "Select Payment Method",
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: Text("Cash"),
                          value: "Cash",
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text("Online Payment"),
                          value: "Online",
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  if (selectedPaymentMethod == "Online") _buildCardDetailsForm(),

                  SizedBox(height: 30),

                  GestureDetector(
                    onTap: _validateAndProceed,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Confirm Booking",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.deepPurple, Colors.white]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          "Book Your Slot",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({required String title, required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.purple)),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _buildCardDetailsForm() {
    return Form(
      key: _formKey,
      child: _buildSelectionCard(
        title: "Enter Card Details",
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Card Number", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              maxLength: 16,
              validator: (value) => value!.length != 16 ? "Enter a valid card number" : null,
              onSaved: (value) => cardNumber = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Expiry Date (MM/YY)", border: OutlineInputBorder()),
              keyboardType: TextInputType.datetime,
              validator: (value) => value!.isEmpty ? "Enter expiry date" : null,
              onSaved: (value) => expiryDate = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "CVV", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              maxLength: 3,
              validator: (value) => value!.length != 3 ? "Enter valid CVV" : null,
              onSaved: (value) => cvv = value,
            ),
          ],
        ),
      ),
    );
  }
}
