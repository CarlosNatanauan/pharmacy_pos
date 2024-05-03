import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserManagement(),
  ));
}

class UserManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of items per row
              crossAxisSpacing: 15.0, // Spacing between items horizontally
              mainAxisSpacing: 15.0, // Spacing between items vertically
            ),
            itemCount: 5, // Placeholder for number of users
            itemBuilder: (context, index) {
              // Placeholder user data
              String firstName = "John";
              String middleName = "Doe";
              String lastName = "Smith";
              String username = "johnsmith";
              String password = "********";
              String imageUrl = "assets/images/img.png"; // Placeholder image URL

              return SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: canvasColor,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Image
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Image.asset(
                            imageUrl,
                            width: screenWidth * 0.07, // Adjust based on screen size
                            height: screenWidth * 0.07, // Adjust based on screen size
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Full Name
                      Text(
                        '$firstName $middleName $lastName',
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.005), // Adjust based on screen size
                      // User Credentials
                      Text(
                        'Username: $username\nPassword: $password',
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.008), // Adjust based on screen size
                      // Edit Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add edit functionality here
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(color: white,
                            ),

                          ),
                          style: ElevatedButton.styleFrom(

                            foregroundColor: white,
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
