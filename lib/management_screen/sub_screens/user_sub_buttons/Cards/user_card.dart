import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../model/user_provider.dart';
import 'edit_user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: _buildUserImage(context),
          ),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  '${user.firstName} ${user.middleName} ${user.lastName}',
                  style: TextStyle(
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.005), // Adjust based on screen size
                // Credentials
                Text(
                  'Username: ${user.username}\nPassword: ${user.password}',
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
                  _confirmDelete(context, user);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: white),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: white,
                  backgroundColor: Colors.red.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUserScreen(user: user),
                    ),
                  );
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

  // Function to build user image widget
  Widget _buildUserImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (user.imageUrl.isNotEmpty) {
      // Check if the imageUrl is not empty
      if (File(user.imageUrl).existsSync()) {
        // Check if the file exists
        return Image.file(
          File(user.imageUrl),
          width: screenWidth * 0.07,
          height: screenWidth * 0.07,
          fit: BoxFit.cover,
        );
      }
    }
    // Display placeholder image when imageUrl is empty or file doesn't exist
    return Image.asset(
      'assets/images/no_image.jpg',
      width: screenWidth * 0.07,
      height: screenWidth * 0.07,
      fit: BoxFit.cover,
    );
  }

  // Function to show delete confirmation dialog
  void _confirmDelete(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete", style: TextStyle(color: white, fontSize: 20)),
          content: Text("Are you sure you want to delete this user?", style: TextStyle(color: white)),
          backgroundColor: scaffoldBackgroundColor,
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("Cancel", style: TextStyle(color: white)),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Delete the user
                Provider.of<UserProvider>(context, listen: false).deleteUser(user);
              },
              child: Text("Delete", style: TextStyle(color: Colors.red.withOpacity(0.7))),
            ),
          ],
        );
      },
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
