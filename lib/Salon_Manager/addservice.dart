import 'dart:io';

import 'package:demo/Salon_Manager/SalonManagerDashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class addservice extends StatefulWidget {
  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}
void _showSuccessPopup(BuildContext context){
  showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Success"),
          content: Text("Details Saved Successfully!"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel")
            ),
            TextButton(onPressed:(){
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => Salonmanagerdashboard()),
                      (route) => false);

            } , child: Text("OK"))
          ],

        );
      }
  );
}

class _AddServiceScreenState extends State<addservice> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _stylistControroller = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  File? _image;
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Service"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _serviceNameController,
                decoration: InputDecoration(
                  labelText: "Service Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter service name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _stylistControroller,
                decoration: InputDecoration(
                  labelText:"Stylist Name ",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value==null||value.isEmpty){
                    return"Please enter stylist name ";
                  }
                  return null;
                }
              ),


              SizedBox(height: 16),

              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Center(child: Text("Tap to select image"))
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter price";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Duration (in minutes)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter duration";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Service added successfully!")),
                    );
                  }
                },
                child: Text("Save Service"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}