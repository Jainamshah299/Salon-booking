import 'package:flutter/material.dart';

class complainscreen extends StatefulWidget {
  const complainscreen({super.key});

  @override
  State<complainscreen> createState() => _complainscreenState();
}

class _complainscreenState extends State<complainscreen> {
  final name= ["shah","sharma","desai"];
  final rating=[4.5,4.0,2.0];
  final complain=["Service was great.","Nice experience","Bad experience "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Feedback"),),
      body:ListView.builder(
        itemCount: name.length,
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            ),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: Text(
                  name[index][0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              title: Text(name[index],
                style:TextStyle(fontWeight: FontWeight.bold) ,),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("complain:${complain[index]}"),
                  Text("rating:${rating[index]}")
                ],
              ),
            ),
          );

        }
      )
    );
  }
}
