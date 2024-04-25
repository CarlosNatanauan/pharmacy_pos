import 'package:flutter/material.dart';
import 'package:pharmacy_pos/home_selection.dart'; // Importing home_selection.dart

// Define the color scheme
const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class MainLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: scaffoldBackgroundColor,
      body: Center(
        child: Container(
          width: 300, // Set container width as needed
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
                style: TextStyle(color: white),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: white),
                  ),
                ),
                style: TextStyle(color: white),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to HomeSelectionScreen when button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeSelectionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
