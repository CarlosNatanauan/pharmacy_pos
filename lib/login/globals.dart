import 'package:flutter/material.dart';

bool isAdmin = false;

Widget buildWelcomeCard() {
  String welcomeMessage = isAdmin ? 'Welcome Admin' : 'Welcome User';
  return Container(
    width: 300,
    height: 300,
    child: Card(
      color: Colors.blue, // Change color as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            welcomeMessage,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Handle Ok button press
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text('Ok'),
          ),
        ],
      ),
    ),
  );
}
