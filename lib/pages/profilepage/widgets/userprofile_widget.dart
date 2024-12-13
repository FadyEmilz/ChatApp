import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserprofileWidget extends StatelessWidget {
  const UserprofileWidget({super.key,  required this.email, required this.country, required this.username, required this.onEditProfile});
  final String username;
  final String email;
  final String country;
  final VoidCallback onEditProfile;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: Text(
            username[0].toUpperCase(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Text(
          username,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          email,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          country,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: onEditProfile,
          icon: Icon(Icons.edit),
          label: Text("Edit Profile"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
