import 'package:flutter/material.dart';
import 'globals.dart'; // Import globals.dart file
import '../management_screen/main_man_screen.dart';
import '../pos_screen/main_pos_screen.dart';

// Define the color scheme
const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class MainLoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          child: Form(
            onWillPop: () async => false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Welcome Card


                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: white),
                    ),
                  ),
                  style: TextStyle(color: white),
                  onFieldSubmitted: (_) => _submitForm(context),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: white),
                    ),
                  ),
                  style: TextStyle(color: white),
                  obscureText: true,
                  onFieldSubmitted: (_) => _submitForm(context),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _submitForm(context),
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
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    // Check credentials and navigate accordingly
    if (username == 'man' && password == 'man') {
      isAdmin = false; // Set isAdmin to true for manager
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainManagementScreen()),
      );

    } else if (username == 'pos' && password == 'pos') {
      isAdmin = false; // Set isAdmin to false for cashier
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPosScreen()),
      );
    } else if (username == 'admin' && password == 'admin') {
      isAdmin = true; // Set isAdmin to true for admin
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainManagementScreen()),
      );
    } else {
      // Handle incorrect credentials
      // For now, you can show a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect username or password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
