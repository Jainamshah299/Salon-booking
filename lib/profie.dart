import 'package:demo/profileaboutsalon.dart';
import 'package:flutter/material.dart';
import 'package:demo/LoginScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> title = ["Your Favourites", "Payments", "About", "Logout"];
  final List<IconData> icon = [
    Icons.favorite_border,
    Icons.payment,
    Icons.info_outline,
    Icons.logout
  ];

  void _showLogoutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Close dialog
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close popup
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false, // Clears navigation stack
              );
            },
            child: Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/image/logo.jpeg'),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: title.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(icon[index]),
                              title: Text(title[index]),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                if (index == 3) {
                                  _showLogoutPopup(context);
                                }
                                else if(index==2){
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context)=>AboutPage()),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}




