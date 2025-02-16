import 'package:flutter/material.dart';

class Salondetailpage extends StatefulWidget {
  const Salondetailpage({super.key});

  @override
  State<Salondetailpage> createState() => _SalondetailpageState();
}

class _SalondetailpageState extends State<Salondetailpage> {
  var service = ["haircuts"];
  var image = ["assets/image/Rectangle_3.png"];
  var button = ["ADD"];
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
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
                        'assets/image/Rectangle_3.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 306,
                      ),
                      Image.asset(
                        'assets/image/Rectangle_3.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 306,
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Text(
                          "Salon name",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 20,
                    child: Text("hdf"),
                  ),
                  Column(
                    children: [
                      ListView.builder(
                          itemCount: service.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(
                                image[index],
                                fit: BoxFit.fill,
                              ),
                              title: Text(service[index]),
                              trailing: ElevatedButton.icon(
                                  onPressed: () {
                                    if(isAdded){
                                      setState(() {
                                        isAdded=false;

                                      });
                                    }
                                    else{
                                      setState(() {
                                        isAdded=true;

                                      });

                                    }


                                  }, label: Text("ADD")),
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
          if(isAdded)...[
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
                  Row(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        margin: EdgeInsets.only(right: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Text("2",style: TextStyle(color: Colors.white),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("449",style: TextStyle(color: Colors.white)),
                          Text("plus taxes",style: TextStyle(color: Colors.white)),
                        ],)
                    ],
                  ),
                  Text("Continue",style: TextStyle(color: Colors.white)),
                ],

              ),
            ),
          ],

        ],
      ),
    );
  }
}
