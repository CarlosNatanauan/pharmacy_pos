import 'package:flutter/material.dart';
import 'globals.dart';
import '../management_screen/main_man_screen.dart';
import '../pos_screen/main_pos_screen.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: accentCanvasColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/pharmacy.png',
                    height: 350,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nucleio PharmaNode',
                    style: TextStyle(fontSize: 40, color: Color(0xFFD2CEFF), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(130.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Hello! Let\'s get started',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        SizedBox(height: 10),

                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
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
                                foregroundColor: white,
                                backgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),




        ],
      ),
    );
  }



  void _submitForm(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    // Check credentials and navigate accordingly
    if (username == 'man' && password == 'man') {
      isAdmin = false; // Set isAdmin to true for manager
      UserType = 'man'; // Set UserType to 'man' for manager
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainManagementScreen()),
      );

    } else if (username == 'pos' && password == 'pos') {
      isAdmin = false; // Set isAdmin to false for cashier
      UserType = 'pos'; // Set UserType to 'pos' for cashier
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPosScreen()),
      );
    } else if (username == 'admin' && password == 'admin') {
      isAdmin = true; // Set isAdmin to true for admin
      UserType = 'admin'; // Set UserType to 'admin' for admin
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
