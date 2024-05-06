import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cards/user_card.dart';
import 'model/user.dart';
import 'model/user_provider.dart';

void main() {
  runApp(MaterialApp(
    home: UserManagement(),
  ));
}

class UserManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              // Container for Cashier role
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cashier(s)',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Consumer<UserProvider>(
                            builder: (context, userProvider, child) {
                              List<User> cashiers = userProvider.getCashiers();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: cashiers.map((user) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: UserCard(
                                      user: user, // Pass the user object to UserCard
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              // Container for Store Manager role
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Store Manager(s)',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Consumer<UserProvider>(
                            builder: (context, userProvider, child) {
                              List<User> storeManagers = userProvider.getStoreManagers();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: storeManagers.map((user) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: UserCard(
                                      user: user, // Pass the user object to UserCard
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }








}





const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
