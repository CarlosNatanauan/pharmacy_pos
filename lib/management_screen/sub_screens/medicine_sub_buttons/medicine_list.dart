import 'package:flutter/material.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class MedicineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Container
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SingleChildScrollView( // Making the container scrollable
                child: Container(
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
                        'Add Medicine',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'SKU', // Adding hint text
                          hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'Barcode number', // Adding hint text
                          hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Dropdown for Category
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          border: OutlineInputBorder(),
                          hintText: 'Category',
                          hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        ),
                        items: <String>['Category A', 'Category B', 'Category C', 'Category D']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: white)),
                          );
                        }).toList(),
                        onChanged: (String? value) {},
                      ),
                      SizedBox(height: 20),

                      // Dropdown for Type
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          border: OutlineInputBorder(),
                          hintText: 'Type',
                          hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        ),
                        items: <String>['Type 1', 'Type 2', 'Type 3', 'Type 4']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: white)),
                          );
                        }).toList(),
                        onChanged: (String? value) {},
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'Product name', // Adding hint text
                          hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'Measurement', // Adding hint text
                          hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'Description', // Adding hint text
                          hintStyle: TextStyle(color: white.withOpacity(0.5)), // Hint text color
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: containerColor,
                          hintText: 'Product price', // Adding hint text
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
                            child: Text('Clear'),
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
                      'Medicine List',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Medicine list content can be added here
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
