import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/dashboard.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/operations.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/medicine.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/entities.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/users.dart';
import 'package:sidebarx/sidebarx.dart';

import '../login/globals.dart';
import '../login/main_login.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);


void main() {
  runApp(MainManagementScreen());
}

class MainManagementScreen extends StatelessWidget {
  MainManagementScreen({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  // Mapping between sidebar titles and corresponding screen widgets
  final Map<String, Widget> _screens = {
    'Dashboard': Dashboard(),
    'Medicine': Medicine(),
    'Operations': Operations(),
    'Entities': Entities(),
    'Users': Users(),
  };

  @override
  Widget build(BuildContext context) {
    // Call your welcome message here
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      WelcomeMessage.show(context);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
              backgroundColor: canvasColor,
              title: Text(_getTitleByIndex(_controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                      screens: _screens,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  }) : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Image.asset('assets/images/img.png'),
              ),
            ),
            if (extended) // Display text only when sidebar is maximized
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8),
                child: Text(
                  'Nucleio Pharmacy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.local_hospital_rounded,
          label: 'Medicine',
        ),
        const SidebarXItem(
          icon: Icons.business,
          label: 'Operations',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Entities',
        ),
        if (isAdmin)
          const SidebarXItem(
            icon: Icons.person,
            label: 'Users',
          ),
      ],
      footerBuilder: (context, extended) {
        // Calculate the width and height of the sidebar menu bar
        final sidebarWidth = MediaQuery.of(context).size.width * 0.2; // 20% of the screen width
        final sidebarHeight = MediaQuery.of(context).size.height; // Full height of the screen

        // Define the colors and styles
        final Color buttonColor = extended ? canvasColor : accentCanvasColor;

        // Function to handle logout action
        void logout() {
          // Show dialog to confirm logout
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Logout", style: TextStyle(color: white, fontSize: 20)),
                content: Text("Are you sure you want to logout?", style: TextStyle(color: white)),
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
                      // Navigate to the login screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainLoginScreen()),
                      );
                    },
                    child: Text("Logout", style: TextStyle(color: Colors.red.withOpacity(0.7))),
                  ),
                ],
              );
            },
          );
        }

        // Check if the sidebar is extended or not
        if (extended) {
          // If extended, display the logout button with icon
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0), // Add vertical padding
            child: SizedBox(
              width: sidebarWidth, // Set the width to the width of the sidebar menu bar
              height: sidebarHeight * 0.05, // Set the height to 5% of the screen height
              child: ElevatedButton.icon(
                onPressed: logout, // Call logout function when button is pressed
                icon: Icon(Icons.exit_to_app, color: Colors.red.withOpacity(0.7)),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red.withOpacity(0.7)),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.redAccent.withOpacity(0.7), // Change button color when hovered
                  backgroundColor: buttonColor,
                  elevation: 0, // Remove button elevation
                  padding: EdgeInsets.all(5), // Set button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius to 10
                  ),
                ),
              ),
            ),
          );
        } else {
          // If minimized, display only the logout icon
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0), // Add vertical padding
            child: IconButton(
              onPressed: logout, // Call logout function when icon is pressed
              icon: Icon(Icons.exit_to_app, color: Colors.red.withOpacity(0.7)),
            ),
          );
        }
      },
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
    required this.screens,
  }) : super(key: key);

  final SidebarXController controller;
  final Map<String, Widget> screens;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        final screenWidget = screens[pageTitle];
        return Center(
          child: screenWidget != null
              ? screenWidget
              : Text(
            'Not found page',
            style: theme.textTheme.headlineSmall,
          ),
        );
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Medicine';
    case 2:
      return 'Operations';
    case 3:
      return 'Entities';
    case 4:
      return 'Users';
    default:
      return 'Dashboard';
  }
}

