import 'package:flutter/material.dart';

class viewreview extends StatefulWidget {
  const viewreview({super.key});

  @override
  State<viewreview> createState() => _viewreviewState();
}

class _viewreviewState extends State<viewreview> {
  final name=["jay","smith","rahul","rohan"];
  final feedback=["Great service","Excellent Service","bad service","Excellent Service and friendly staff"];
  final rating=[3.0,4.0,2.0,5.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View feedback")
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            boxShadow:[
              BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          spreadRadius: 2,
              )
            ]
          ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  name[index][0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              title: Text(
                name[index],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("feedback: ${feedback[index]}", style: const TextStyle(color: Colors.grey)),
                  Text("rating: ${rating[index]}", style: const TextStyle(color: Colors.grey)),

                ],
              ),
            ),
          );
          }



          )
    );
  }
}
