import 'package:demo/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 3.0;
  final TextEditingController _descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rate Your Experience")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _descriptioncontroller,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "Rating",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {_showSuccessPopup(context);

              },
              child: Text("Submit",),


            ),
          ],
        ),
      ),
    );
  }
}
void _showSuccessPopup(BuildContext context){
  showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Thank You"),
          content: Text("Thank You For Feedback"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel")
            ),
            TextButton(onPressed:(){
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
                      (route) => false);

            } , child: Text("OK"))
          ],

        );
      }
  );
}


