import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'dashboard.dart'; // Import dashboard content
import 'products.dart'; // Import products content

class MainManagementScreen extends StatefulWidget {
  const MainManagementScreen({Key? key}) : super(key: key);

  @override
  _MainManagementScreenState createState() => _MainManagementScreenState();
}

class _MainManagementScreenState extends State<MainManagementScreen> {
  // Variable to track selected content
  int selectedIndex = 0;

  // Views to display
  List<Widget> views = [
    Dashboard(),
    Products(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Navigation Bar
          SideNavigationBar(
            header: SideNavigationBarHeader(
              image: Image.asset(
                'assets/images/img.png', // Replace this with your image path
                width: 50, // Set the width to match the desired size
                height: 50, // Set the height to match the desired size
              ),
              title: Text('Title widget'),
              subtitle: Text('Subtitle widget'),
            ),

            footer: SideNavigationBarFooter(
              label: Text('© Nucleio Information Services'),
            ),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.shopping_cart,
                label: 'Products',
              ),
            ],
            onTap: (index) {
              // Update content to display 'Dashboard' or 'Products'
              setState(() {
                selectedIndex = index;
              });
            },
            toggler: SideBarToggler(
              expandIcon: Icons.arrow_forward_ios_rounded,
              shrinkIcon: Icons.arrow_back_ios_rounded,
              onToggle: () {
                setState(() {
                  // Toggle the menu
                  // You can add custom logic here
                });
              },
            ),
          ),

          // Expanded Container for Content
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white, // Background color to identify overflow
              child: Center(
                child: views[selectedIndex], // Display selected content
              ),
            ),
          ),
        ],
      ),
    );
  }
}
