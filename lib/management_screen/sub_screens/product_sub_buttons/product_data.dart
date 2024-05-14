import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class ProductData extends StatefulWidget {
  final String productName;
  final XFile? productImage;

  ProductData({required this.productName, this.productImage});

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  TextEditingController _skuController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String? _selectedCategory;
  String? _selectedType;
  TextEditingController _measurementController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.productName;
    _image = widget.productImage;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text(
          'Edit Medicine Info',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: screenSize.width * 1, // Set container width based on screen width
            height: screenSize.height * 0.85, // Set container height based on screen height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: canvasColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Left Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: containerColor,
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  _image == null
                                      ? Icon(Icons.camera_alt, size: 40, color: white)
                                      : Image.file(
                                    File(_image!.path),
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    _image == null ? 'Click to select image' : 'Click to change image',
                                    style: TextStyle(color: white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _skuController,
                            decoration: InputDecoration(
                              labelText: 'SKU',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter SKU';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),


                          SizedBox(height: 20),

                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Product Description',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _measurementController,
                            decoration: InputDecoration(
                              labelText: 'Product Measurement',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter measurement';
                              }
                              return null;
                            },
                          ),


                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    // Middle Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(height: 20),
                          TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(
                              labelText: 'Product Price',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter price';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Product Type',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            items: <String>['Type A', 'Type B', 'Type C']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedType = value;
                              });
                            },
                            value: _selectedType,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select type';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Product Category',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            items: <String>['Category A', 'Category B', 'Category C']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            },
                            value: _selectedCategory,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select category';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Product Date',
                            style: TextStyle(color: white),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Text(
                              _selectedDate.toString(),
                              style: TextStyle(color: white),
                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Save',
                              style: TextStyle(color: white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Right Column

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }
}
