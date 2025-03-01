import 'package:demo/Slotbook.dart';
import 'package:flutter/material.dart';

class Salondetailpage extends StatefulWidget {
  const Salondetailpage({super.key});

  @override
  State<Salondetailpage> createState() => _SalondetailpageState();
}

class _SalondetailpageState extends State<Salondetailpage> {
  final List<String> service = ["Haircuts", "Shaving", "Facial", "Massage"];
  final List<String> image = [
    "assets/image/Rectangle_3.png",
    "assets/image/beard.png",
    "assets/image/Rectangle_3.png",
    "assets/image/beard.png"
  ];
  final List<int> price = [200, 150, 300, 500];

  Map<int, bool> isSelected = {};

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    isSelected.forEach((key, value) {
      if (value) totalPrice += price[key];
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/image/aesthetic_salon.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 306,
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Text(
                          "Woodlands Hill Salon",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon:Icon(Icons.call,color: Colors.grey,size: 30),
                          onPressed: (){},),
                        IconButton(
                          icon:Icon(Icons.location_on,color: Colors.grey,size: 30),
                          onPressed: (){},),
                        IconButton(
                          icon:Icon(Icons.share,color: Colors.grey,size: 30),
                          onPressed: (){},),
                      ],
                    ),
                  ),



                  ListView.builder(
                    itemCount: service.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          image[index],
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),

                        title: Text(service[index]),
                        subtitle: Text("₹${price[index]}"),
                        trailing: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSelected[index] = !(isSelected[index] ?? false);
                            });
                          },
                          child: Text(isSelected[index] == true ? "REMOVE" : "ADD"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          if (isSelected.containsValue(true))
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total: ₹$totalPrice", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),

                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Slotbook()),
                      );
                    },
                    child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

}
