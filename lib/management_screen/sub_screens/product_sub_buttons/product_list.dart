import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/product_list_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/provider/product_list_provider.dart';

import 'package:provider/provider.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final TextEditingController _productController = TextEditingController();
  late String _searchText;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _searchText = '';
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    List<Product> filteredProduct = productProvider.products
        .where((product) =>
        product.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    void deleteProduct(Product product) {
      productProvider.deleteProduct(product);
    }

    void _showEditPrompt(Product product) {
      TextEditingController _editController =
      TextEditingController(text: product.name);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Edit Product",
              style: TextStyle(color: white, fontSize: 20),
            ),
            content: TextFormField(
              controller: _editController,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                filled: true,
                fillColor: containerColor,
                hintText: 'Enter new product name',
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
                  // Update the product name
                  productProvider.updateProduct(
                      product, _editController.text);
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
                    'Product',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: containerColor,
                      ),
                      padding: EdgeInsets.all(20),
                      child: InkWell(
                        onTap: _pickImage, // Launch the image picker on tap
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _image == null
                                ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                                : Image.file(
                              File(_image!.path),
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              _image == null ? 'Click to select image' : 'Click to change image',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    controller: _productController,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: containerColor,
                      hintText: 'Enter product name', // Adding hint text
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.5)), // Hint text color
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final product = Product(
                            id: '1', // Default ID
                            name: _productController.text,
                          );
                          productProvider.addProduct(product);
                          _productController.clear();
                        },
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
                        onPressed: () {
                          _productController.clear();
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
                      'Product List',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
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
                              hintText: 'Search product',
                              hintStyle: TextStyle(
                                  color: white.withOpacity(0.5)), // Set hint text color to white
                              filled: true,
                              fillColor: containerColor,
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12), // Adjust horizontal padding
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
                          width: MediaQuery.of(context).size.width * 0.52,
                          child: DataTable(
                            dataRowHeight: 160, // Set the height of each row
                            columnSpacing: 20,
                            columns: [
                              DataColumn(
                                  label: Text('ID',
                                      style: TextStyle(color: white))),
                              DataColumn(
                                  label: Text('Product Info',
                                      style: TextStyle(color: white))),
                              DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(color: white))),
                            ],
                            rows: filteredProduct.map((product) {
                              return DataRow(cells: [
                                DataCell(
                                    Text(product.id,
                                        style: TextStyle(color: white))),
                                DataCell(
                                  Flexible(
                                    child: Container(
                                      constraints: BoxConstraints(minHeight: 100),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('SKU: ${product.sku}',
                                                style: TextStyle(color: white)),
                                            Text('Name: ${product.name}',
                                                style: TextStyle(color: white)),
                                            Text('Category: ${product.category}',
                                                style: TextStyle(color: white)),
                                            Text('Type: ${product.type}',
                                                style: TextStyle(color: white)),
                                            Text('Measurement: ${product.measurement}',
                                                style: TextStyle(color: white)),
                                            Text('Description: ${product.description}',
                                                style: TextStyle(color: white)),
                                            Text('Product Price: ${product.productPrice}',
                                                style: TextStyle(color: white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _showEditPrompt(product);
                                      },
                                      child: Text('Edit'),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        foregroundColor: white,
                                        backgroundColor:
                                        Colors.blueAccent.withOpacity(0.7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
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
                                                style: TextStyle(
                                                    color: white, fontSize: 20),
                                              ),
                                              content: Text(
                                                "Are you sure you want to delete this product?",
                                                style: TextStyle(color: white),
                                              ),
                                              backgroundColor:
                                              scaffoldBackgroundColor,
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: Text("Cancel",
                                                      style: TextStyle(
                                                          color: white)),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    deleteProduct(
                                                        product);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: Text("Delete",
                                                      style: TextStyle(
                                                          color: Colors.red
                                                              .withOpacity(
                                                              0.7))),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Delete'),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        foregroundColor: white,
                                        backgroundColor:
                                        Colors.red.withOpacity(0.7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
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