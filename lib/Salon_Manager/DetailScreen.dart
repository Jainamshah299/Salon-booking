import 'package:demo/Salon_Manager/SalonManagerDashboard.dart';
import 'package:flutter/material.dart';
class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _salonNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Add Details') ,),
      body: Padding(padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _salonNameController,
              decoration: InputDecoration(
                labelText: "Salon Name",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if (value==null || value.isEmpty){
                  return"Please Enter Salon Name ";
                }
                return null;
              }
            ),
            SizedBox(height: 15,),
            TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value==null || value.isEmpty){
                    return"Please Enter address ";
                  }
                  return null;
                }
            ),
            SizedBox(height: 12),

            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                _showSuccessPopup(context);
              }
            },
            child: Text("Submit"),)

          ],
        ),
      ),),

    );
  }


}

