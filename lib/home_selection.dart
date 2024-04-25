import 'package:flutter/material.dart';
import 'package:pharmacy_pos/pos_screen/main_pos_screen.dart';
import 'management_screen/main_man_screen.dart'; // Importing main_management_screen.dart

class HomeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to main_pos_screen.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPosScreen()),
                );
              },
              child: Text('POS Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to main_management_screen.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainManagementScreen()),
                );
              },
              child: Text('Management Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
