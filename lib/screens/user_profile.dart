import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String bio;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.bio,
  }) : super(key: key);

  void _showPersonalInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFFEDE1D2), // Coconut
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Informations personnelles",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D2510), // Palm Oil
                )),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email, color: Color(0xFF806044)),
              title: Text("douaa@example.com"),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Color(0xFF806044)),
              title: Text("+213 555 123 456"),
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Color(0xFF806044)),
              title: Text("••••••••"),
              trailing: TextButton(
                onPressed: () {},
                child: Text("Changer"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCBB89D), // Butter
      appBar: AppBar(
        backgroundColor: Color(0xFF6A6F4C), // Organic
        title: Text(
          username,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _showPersonalInfo(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF412F26), // Cocoa
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            const SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D2510), // Palm Oil
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bio,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF806044), // Natural
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
