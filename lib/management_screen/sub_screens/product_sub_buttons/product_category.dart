import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/category_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/provider/category_provider.dart';

import 'package:provider/provider.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class ProductCategory extends StatefulWidget {
  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final TextEditingController _categoryController = TextEditingController();
  late String _searchText;

  @override
  void initState() {
    super.initState();
    _searchText = '';
  }



  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);



    List<Category> filteredCategories = categoryProvider.categories
        .where((category) =>
        category.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    void deleteCategory(Category category) {
      categoryProvider.deleteCategory(category);
    }

    void _showEditPrompt(Category category) {
      TextEditingController _editController = TextEditingController(text: category.name);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Edit Category",
              style: TextStyle(color: white, fontSize: 20),
            ),
            content: TextFormField(
              controller: _editController,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                filled: true,
                fillColor: containerColor,
                hintText: 'Enter new category name',
                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                border: OutlineInputBorder(),
              ),
            ),
            backgroundColor: scaffoldBackgroundColor,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Cancel", style: TextStyle(color: white)),
              ),
              TextButton(
                onPressed: () {
                  // Update the category name
                  categoryProvider.updateCategory(category, _editController.text);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Save", style: TextStyle(color: Colors.green)),
              ),
            ],
          );
        },
      );
    }



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
                    'Product Category',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    controller: _categoryController,
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
                        onPressed: () {
                          _categoryController.clear();
                        },
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
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          final category = Category(
                            id: '1', // Default ID
                            name: _categoryController.text,
                          );
                          categoryProvider.addCategory(category);
                          _categoryController.clear();
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          foregroundColor: white,
                          backgroundColor: Colors.green.withOpacity(0.7),
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
                        //add sort option later in here
                        Spacer(), // Spacer to push search bar to the rightmost
                        // Container for search bar
                        Container(
                          width: 200, // Increased width of the search box
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                              });
                            },
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
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.52, // Match the width of the container
                          child: DataTable(
                            columnSpacing: 20, // Adjust column spacing as needed
                            columns: [
                              DataColumn(label: Text('ID', style: TextStyle(color: white))),
                              DataColumn(label: Text('Name', style: TextStyle(color: white))),
                              DataColumn(label: Text('Action', style: TextStyle(color: white))),
                            ],
                            rows: filteredCategories.map((category) {
                              return DataRow(cells: [
                                DataCell(Text(category.id, style: TextStyle(color: white))),
                                DataCell(Text(category.name, style: TextStyle(color: white))),
                                DataCell(Row(
                                  children: [


                                    ElevatedButton(
                                      onPressed: () {
                                        _showEditPrompt(category);
                                      },
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
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Confirm Deletion",
                                                style: TextStyle(color: white, fontSize: 20),
                                              ),
                                              content: Text(
                                                "Are you sure you want to delete this category?",
                                                style: TextStyle(color: white),
                                              ),
                                              backgroundColor: scaffoldBackgroundColor,
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(); // Close the dialog
                                                  },
                                                  child: Text("Cancel", style: TextStyle(color: white)),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    deleteCategory(category); // Delete the category
                                                    Navigator.of(context).pop(); // Close the dialog
                                                  },
                                                  child: Text("Delete", style: TextStyle(color: Colors.red.withOpacity(0.7))),
                                                ),
                                              ],
                                            );
                                          },
                                        );

                                      },
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
                              ]);
                            }).toList(),
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
