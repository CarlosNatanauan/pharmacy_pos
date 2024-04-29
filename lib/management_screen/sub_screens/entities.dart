import 'package:flutter/material.dart';

import 'entities_sub_buttons/customer_list.dart';
import 'entities_sub_buttons/supplier_list.dart';
import 'operation_sub_buttons/inventory.dart';
import 'operation_sub_buttons/receiving.dart';
import 'operation_sub_buttons/sales.dart';





class Entities extends StatefulWidget {
  @override
  _EntitiesState createState() => _EntitiesState();
}

class _EntitiesState extends State<Entities> {
  int _selectedIndex = 0;
  final List<String> _tabTitles = ['Customer List', 'Supplier List'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // remove the app bar title
        child: AppBar(
          automaticallyImplyLeading: false, // remove back button
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add spacing between title and categories
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.08),
                child: Container(
                  height: 50, // Set the height of the buttons
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    color: white.withOpacity(0.7),
                    selectedColor: white,
                    fillColor: primaryColor,
                    splashColor: primaryColor.withOpacity(0.5),
                    highlightColor: primaryColor.withOpacity(0.5),
                    borderWidth: 2,
                    borderColor: primaryColor,
                    selectedBorderColor: primaryColor,
                    constraints: BoxConstraints.expand(width: (constraints.maxWidth * 0.8) / _tabTitles.length), // adjust button width
                    children: [
                      _buildTabButton(0),
                      _buildTabButton(1),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    isSelected: List.generate(_tabTitles.length, (index) => index == _selectedIndex),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: _buildSelectedScreen(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        _tabTitles[index],
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSelectedScreen(int index) {
    switch (index) {
      case 0:
        return CustomerList();
      case 1:
        return SupplierList();

      default:
        return Container();
    }
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
