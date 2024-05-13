import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/medicine_sub_buttons/model/medicine_list_model.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/medicine_sub_buttons/provider/medicine_list_provider.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  final TextEditingController _medicineController = TextEditingController();
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
    final medicineProvider = Provider.of<MedicineProvider>(context);

    List<Medicine> filteredMedicines = medicineProvider.medicines
        .where((medicine) =>
        medicine.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    void deleteMedicine(Medicine medicine) {
      medicineProvider.deleteMedicine(medicine);
    }

    void _showEditPrompt(Medicine medicine) {
      TextEditingController _editController =
      TextEditingController(text: medicine.name);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Edit Medicine",
              style: TextStyle(color: white, fontSize: 20),
            ),
            content: TextFormField(
              controller: _editController,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                filled: true,
                fillColor: containerColor,
                hintText: 'Enter new medicine name',
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
                  // Update the medicine name
                  medicineProvider.updateMedicine(
                      medicine, _editController.text);
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
                    'Medicine',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
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
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _medicineController,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: containerColor,
                      hintText: 'Enter medicine name', // Adding hint text
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
                          final medicine = Medicine(
                            id: '1', // Default ID
                            name: _medicineController.text,
                          );
                          medicineProvider.addMedicine(medicine);
                          _medicineController.clear();
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
                          _medicineController.clear();
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
                      'Medicine List',
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
                              hintText: 'Search medicine',
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
                                  label: Text('Medicine Info',
                                      style: TextStyle(color: white))),
                              DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(color: white))),
                            ],
                            rows: filteredMedicines.map((medicine) {
                              return DataRow(cells: [
                                DataCell(
                                    Text(medicine.id,
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
                                            Text('Name: ${medicine.name}',
                                                style: TextStyle(color: white)),
                                            Text('SKU: ${medicine.sku}',
                                                style: TextStyle(color: white)),
                                            Text('Category: ${medicine.category}',
                                                style: TextStyle(color: white)),
                                            Text('Type: ${medicine.type}',
                                                style: TextStyle(color: white)),
                                            Text('Measurement: ${medicine.measurement}',
                                                style: TextStyle(color: white)),
                                            Text('Description: ${medicine.description}',
                                                style: TextStyle(color: white)),
                                            Text('Product Price: ${medicine.productPrice}',
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
                                        _showEditPrompt(medicine);
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
                                                "Are you sure you want to delete this medicine?",
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
                                                    deleteMedicine(
                                                        medicine);
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