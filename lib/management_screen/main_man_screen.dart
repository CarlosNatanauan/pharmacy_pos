import 'package:flutter/material.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/dashboard.dart';
// Import the new screens
import 'package:pharmacy_pos/management_screen/sub_screens/inventory.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/sales.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/receiving.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/medicine_category.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/medicine_types.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/medicine_list.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/expired_list.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/customer_list.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/suplier_list.dart';
import 'package:pharmacy_pos/management_screen/sub_screens/users.dart';
import 'package:sidebarx/sidebarx.dart';

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
    'Inventory': Inventory(),
    'Sales': Sales(),
    'Receiving': Receiving(),
    'Medicine Category': MedicineCategory(),
    'Medicine Types': MedicineTypes(),
    'Medicine List': MedicineList(),
    'Expired List': ExpiredList(),
    'Supplier List': SupplierList(),
    'Customer List': CustomerList(),
    'Users': Users(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'SidebarX Example',
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
        // Adjust the itemMargin to reduce the spacing between items
        //itemPadd: EdgeInsets.symmetric(vertical: .0),
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

      // Update the sidebar items
      items: [
        const SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.shopping_cart,
          label: 'Inventory',
        ),
        const SidebarXItem(
          icon: Icons.attach_money,
          label: 'Sales',
        ),
        const SidebarXItem(
          icon: Icons.receipt,
          label: 'Receiving',
        ),
        const SidebarXItem(
          icon: Icons.category,
          label: 'Medicine Category',
        ),
        const SidebarXItem(
          icon: Icons.extension,
          label: 'Medicine Types',
        ),
        const SidebarXItem(
          icon: Icons.list_alt,
          label: 'Medicine List',
        ),
        const SidebarXItem(
          icon: Icons.timer,
          label: 'Expired List',
        ),
        const SidebarXItem(
          icon: Icons.local_shipping,
          label: 'Supplier List',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Customer List',
        ),
        const SidebarXItem(
          icon: Icons.person,
          label: 'Users',
        ),
      ],
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
      return 'Inventory';
    case 2:
      return 'Sales';
    case 3:
      return 'Receiving';
    case 4:
      return 'Medicine Category';
    case 5:
      return 'Medicine Types';
    case 6:
      return 'Medicine List';
    case 7:
      return 'Expired List';
    case 8:
      return 'Supplier List';
    case 9:
      return 'Customer List';
    case 10:
      return 'Users';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
