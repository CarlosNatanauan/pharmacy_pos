import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isAdmin = false;
String UserType = '';

class WelcomeMessage {
  static void show(BuildContext context) {
    String userTypeText = '';

    if (isAdmin) {
      userTypeText = 'Admin';
    } else {
      switch (UserType) {
        case 'man':
          userTypeText = 'Store Manager';
          break;
        case 'pos':
          userTypeText = 'Cashier';
          break;
        default:
          userTypeText = 'User';
      }
    }



    String formattedDate = _getFormattedDate();
    String currentTime = _getFormattedTime(); // Initialize current time

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Update current time every second
            updateTime() {
              setState(() {
                currentTime = _getFormattedTime();
              });
            }

            // Call updateTime() initially and every second thereafter
            Timer.periodic(Duration(seconds: 1), (timer) {
              updateTime();
            });

            return AlertDialog(
              backgroundColor: canvasColor,
              title: Column(
                children: [
                  Text(
                    'Welcome $userTypeText',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Today is $formattedDate',
                    style: TextStyle(
                      fontSize: 18,
                      color: white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$currentTime',
                    style: TextStyle(
                      fontSize: 24,
                      color: white,
                    ),
                  ),
                ],
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'We\'re glad to see you!',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static String _getFormattedDate() {
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(DateTime.now());
  }

  static String _getFormattedTime() {
    DateFormat formatter = DateFormat('HH:mm:ss');
    return formatter.format(DateTime.now());
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
