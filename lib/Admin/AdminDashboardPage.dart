import 'package:demo/Admin/AdminPaymentList.dart';
import 'package:demo/Admin/about.dart';
import 'package:demo/Admin/complain.dart';
import 'package:demo/Admin/history.dart';
import 'package:demo/Admin/salon.dart';
import 'package:demo/Admin/user.dart';
import 'package:demo/LoginScreen.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final List<String> title = ["About Us", "Logout"];
  final List<IconData> icon = [Icons.info_outline, Icons.logout];

  final List<Map<String, dynamic>> example=[
    {
    'name': ' View Users',

    'color': Color(0xffB1F2),
    'route':userscreen(),
  },
    {
      'name': 'View Salons',

      'color':Color(0xffB7B1F2),
      'route': salonscreen(),
    },
    {
      'name': 'View Booking ',

      'color': Color(0xffFFDCCC),
      'route': historyscreen(),
    },
    {
      'name': 'View Feedback',

      'color': Color(0xffFBF3B9),
      'route': complainscreen(),
    },
    {
      'name': 'View Payment',

      'color': Color(0xffB7B1F2),
      'route': AdminPaymentList(),
    },
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("ADMIN"),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: example.length,
              itemBuilder: (context,index){
                final containers = example[index];
                return  GestureDetector(
                  onTap: containers.containsKey('route')
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => containers['route'],
                      ),
                    );
                  }
                      : null,
                  child: Card(
                    margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                   color: containers['color'],
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text( containers['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                    ),
                  ),
                );
              }
            )
          ],


        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(icon[index]),
              title: Text(title[index]),
              onTap: (){
                if(title[index]=='Logout'){
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        title: Text("Logout"),
                        content: Text("Are you sure want to logout?"),
                        actions: [
                          TextButton(onPressed:()=>Navigator.pop(context),
                              child: Text("Cancel"),),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()),
                                    (route)=>false,
                                );
                              },
                              child:Text("Logout") )
                        ],
                      ));
                }else if(title[index] == 'About Us'){
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context)=>about()));

                }
                }

            );
          }
        )
      ),
    );
  }
}
