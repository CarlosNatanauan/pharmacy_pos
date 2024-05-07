import 'package:flutter/material.dart';

class ActivityLogs extends StatelessWidget {
  // Sample data for demonstration
  final List<List<String>> rowData = [
    ['Ryan Rems(Store Manager)', '2024-06-01', '09:30 AM', 'Login'],
    ['Nonong Balinan(Cashier)', '2024-05-18', '10:30 AM', 'Logout'],
    ['GB Labrador(Cashier)', '2024-06-15', '11:30 AM', 'Login'],
    ['Muman Reyes(Store Manager)', '2024-05-12', '01:30 PM', 'Logout'],
    ['James Caraan(Cashier)', '2024-05-09', '004:30 PM', 'Login'],
    // Add more rows here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Same as scaffoldBackgroundColor in UserManagement
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Set container width to 90% of the screen width
            decoration: BoxDecoration(
              color: canvasColor, // Use containerColor for the container background
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: DataTable(
                dividerThickness: 2,
                headingRowHeight: 40,
                dataRowHeight: 60,
                columns: [
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(top: 8), // Add padding on top
                      child: Text(
                        'User',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(top: 8), // Add padding on top
                      child: Text(
                        'Date',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(top: 8), // Add padding on top
                      child: Text(
                        'Time',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(top: 8), // Add padding on top
                      child: Text(
                        'Activity Type',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: rowData.map((data) {
                  return DataRow(cells: data.map((cellData) {
                    return DataCell(Text(
                      cellData,
                      style: TextStyle(color: Colors.white),
                    ));
                  }).toList());
                }).toList(),
              ),
            ),
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
