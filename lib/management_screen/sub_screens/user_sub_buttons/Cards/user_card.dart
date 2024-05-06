import 'dart:io';

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String username;
  final String password;
  final String imageUrl;

  const UserCard({
    Key? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerColor,
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.file(
              File(imageUrl), // Use Image.file instead of Image.asset
              width: screenWidth * 0.07, // Adjust based on screen size
              height: screenWidth * 0.07, // Adjust based on screen size
              fit: BoxFit.cover,
            ),
          ),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  '$firstName $middleName $lastName',
                  style: TextStyle(
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.005), // Adjust based on screen size
                // Credentials
                Text(
                  'Username: $username\nPassword: $password',
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Edit and Delete Buttons
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add delete functionality here
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: white),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: white,
                  backgroundColor: Colors.red.withOpacity(0.7), // Use a different color for delete button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add edit functionality here
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: white),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: white,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const white = Colors.white;
const containerColor = Color(0xFF353550);
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
