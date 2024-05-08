import 'package:flutter/material.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class MedicineCategory extends StatefulWidget {
  @override
  _MedicineCategoryState createState() => _MedicineCategoryState();
}

class _MedicineCategoryState extends State<MedicineCategory> {
  List<Map<String, String>> categoryData = [
    {"id": "1", "name": "Vitamins"},
    {"id": "2", "name": "Mood Stabilizers"},
    {"id": "3", "name": "Over-the-Counter Medications"},
    {"id": "4", "name": "Prescription Medications"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Container
            Container(
              width: MediaQuery.of(context).size.width * 0.28,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Medicine Category',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Category Name',
                    style: TextStyle(color: white),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: containerColor,
                      hintText: 'Enter category name', // Adding hint text
                      hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          foregroundColor: white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          foregroundColor: white,
                          backgroundColor: Colors.red.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),
            SizedBox(width: 20),
            // Right Container
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
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
                      'Category List',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        // Container for "Show 10 entries"
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Text(
                                'Show',
                                style: TextStyle(color: white),
                              ),
                              SizedBox(width: 8),
                              DropdownButton<String>(
                                value: '100',
                                icon: Icon(Icons.arrow_drop_down, color: white),
                                style: TextStyle(color: white),
                                dropdownColor: containerColor,
                                onChanged: (String? value) {},
                                items: <String>['10', '20', '50', '100']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      width: 30, // Fixed width for consistency
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'entries',
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(), // Spacer to push search bar to the rightmost
                        // Container for search bar
                        Container(
                          width: 200, // Increased width of the search box
                          child: TextFormField(
                            style: TextStyle(color: white),
                            decoration: InputDecoration(
                              hintText: 'Search category',
                              hintStyle: TextStyle(color: white.withOpacity(0.5)), // Set hint text color to white
                              filled: true,
                              fillColor: containerColor,
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12), // Adjust horizontal padding
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.52, // Match the width of the container
                        child: DataTable(
                          columnSpacing: 20, // Adjust column spacing as needed
                          columns: [
                            DataColumn(label: Text('ID', style: TextStyle(color: white))),
                            DataColumn(label: Text('Name', style: TextStyle(color: white))),
                            DataColumn(label: Text('Action', style: TextStyle(color: white))),
                          ],
                          rows: List<DataRow>.generate(
                            categoryData.length,
                                (index) => DataRow(cells: [
                              DataCell(Text(categoryData[index]['id']!, style: TextStyle(color: white))),
                              DataCell(Text(categoryData[index]['name']!, style: TextStyle(color: white))),
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Edit'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      foregroundColor: white,
                                      backgroundColor: Colors.blueAccent.withOpacity(0.7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Delete'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      foregroundColor: white,
                                      backgroundColor: Colors.red.withOpacity(0.7), // Red for delete button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ]),
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
      ),
    );
  }
}
