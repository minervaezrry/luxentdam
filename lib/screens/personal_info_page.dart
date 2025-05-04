import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Color(0xFF6A6F4C),
      ),
      body: Center(
        child: Text(
          'Personal Information', // Page des informations personnelles
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
