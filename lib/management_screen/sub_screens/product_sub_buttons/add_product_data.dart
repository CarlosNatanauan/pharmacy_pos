import 'dart:io';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/category_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/product_list_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/type_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/provider/category_provider.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/provider/product_list_provider.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/provider/type_provider.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class AddProductData extends StatefulWidget {
  final String? productName;
  final XFile? productImage;

  AddProductData({this.productName, this.productImage});

  @override
  State<AddProductData> createState() => _AddProductDataState();
}

class _AddProductDataState extends State<AddProductData> {
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
  TextEditingController _quantityController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  String get formattedDate {
    return DateFormat.yMd().format(_selectedDate); // Format the date as 'MM/dd/yyyy'
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.productName ?? '';
    _image = widget.productImage;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text(
          'Add Product Info',
          style: TextStyle(color: white),
        ),
        iconTheme: IconThemeData(
          color: white, // Set icon color to white
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
                  color: Colors.white.withOpacity(0.2),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: InkWell(
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
                                      height: 70,
                                      width: 70,
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
                          ),
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
                          // Wrap the DropdownButtonFormField with Consumer to access ProductTypeProvider
                          Consumer<ProductTypeProvider>(
                            builder: (context, productTypeProvider, _) => DropdownButtonFormField<String>(
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
                              items: productTypeProvider.types.map((ProductType type) {
                                return DropdownMenuItem<String>(
                                  value: type.typeName,
                                  child: Text(
                                    type.typeName,
                                    style: TextStyle(color: white),
                                  ),
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
                          ),
                          SizedBox(height: 20),

                          Consumer<ProductCategoryProvider>(
                            builder: (context, categoryProvider, _) => DropdownButtonFormField<String>(
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
                              items: categoryProvider.categories.map<DropdownMenuItem<String>>((Category category) {
                                return DropdownMenuItem<String>(
                                  value: category.categoryName,
                                  child: Text(
                                    category.categoryName,
                                    style: TextStyle(color: white),
                                  ),
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
                          ),



                          SizedBox(height: 20),
                          TextFormField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                              labelText: 'Initial Quantity',
                              labelStyle: TextStyle(color: white.withOpacity(0.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white.withOpacity(0.3)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: white),
                              ),
                            ),
                            style: TextStyle(color: white),
                            keyboardType: TextInputType.number, // Set keyboard type to number
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter quantity';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Expiration Date',
                            style: TextStyle(color: white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    child: Text(
                                      formattedDate,
                                      style: TextStyle(color: white, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30), // Adjust the spacing between expiration date and buttons
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: _clearFields,
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                        foregroundColor: white,
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10), // Adjust the vertical spacing between buttons
                                    ElevatedButton(
                                      onPressed: _addProduct,
                                      child: Text(
                                        'Save',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
    DateTime? selectedDate = _selectedDate;
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        dayTextStyle: TextStyle(color: white.withOpacity(0.9)),
        todayTextStyle: TextStyle(color: white),
        selectedDayHighlightColor: Colors.lightBlue.withOpacity(0.5),
        controlsTextStyle: TextStyle(fontSize: 18,color: white, fontWeight: FontWeight.bold),
        cancelButtonTextStyle: TextStyle(color: Colors.red.withOpacity(0.7)),
        okButtonTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        weekdayLabelTextStyle: TextStyle(fontSize: 16,color: white, fontWeight: FontWeight.bold),
        monthTextStyle: TextStyle(color: white),
        yearTextStyle: TextStyle(color: white),
      ),
      dialogSize: const Size(325, 400),
      value: [selectedDate],
      borderRadius: BorderRadius.circular(15),
    );
    if (results != null && results.isNotEmpty) {
      setState(() {
        _selectedDate = results[0]!;
      });
    }
  }

  void _clearFields() {
    _skuController.clear();
    _nameController.clear();
    _descriptionController.clear();
    _measurementController.clear();
    _priceController.clear();
    _quantityController.clear();
    _quantityController.clear();
    setState(() {
      _selectedCategory = null;
      _selectedType = null;
      _selectedDate = DateTime.now();
      _image = null;
    });
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      // Parse quantity as integer
      int? quantity = int.tryParse(_quantityController.text);
      if (quantity == null) {
        // Show SnackBar for invalid quantity
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid quantity. Please enter a valid number.'),
            duration: Duration(seconds: 2),
          ),
        );
        return; // Exit function
      }

      // If form is valid, create a Product object with entered data including quantity
      Product product = Product(
        name: _nameController.text,
        sku: _skuController.text,
        category: _selectedCategory!,
        type: _selectedType!,
        measurement: _measurementController.text,
        description: _descriptionController.text,
        productPrice: double.tryParse(_priceController.text) ?? 0.0,
        quantity: int.parse(_quantityController.text),
        imageUrl: _image?.path,
        date: _selectedDate,
      );

      if (product.productPrice == 0.0) {
        // Show SnackBar for invalid price
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid price. Please enter a valid number.'),
            duration: Duration(seconds: 2),
          ),
        );
        return; // Exit function
      }

      // Access the ProductProvider instance
      ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
      // Add the product to the provider
      productProvider.addProduct(product);
      // Clear the form fields
      _clearFields();
      // Show SnackBar indicating success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Show SnackBar if form fields are invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}