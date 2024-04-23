import 'package:flutter/material.dart';

class MainPosScreen extends StatelessWidget {
  const MainPosScreen({Key? key}) : super(key: key); // Fixing constructor syntax

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // Add a back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Text(
          'This is the POS screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
