import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/medicine_sub_buttons/provider/type_provider.dart';
import 'package:provider/provider.dart';

import 'model/type_model.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const containerColor = Color(0xFF353550);
const white = Colors.white;

class MedicineTypes extends StatefulWidget {
  @override
  _MedicineTypesState createState() => _MedicineTypesState();
}

class _MedicineTypesState extends State<MedicineTypes> {
  final TextEditingController _typeController = TextEditingController();
  late String _searchText;

  @override
  void initState() {
    super.initState();
    _searchText = '';
  }

  @override
  Widget build(BuildContext context) {
    final typeProvider = Provider.of<MedicineTypeProvider>(context);

    List<MedicineType> filteredTypes = typeProvider.types
        .where((type) =>
        type.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    void deleteType(MedicineType type) {
      typeProvider.deleteType(type);
    }

    void _showEditPrompt(MedicineType type) {
      TextEditingController _editController =
      TextEditingController(text: type.name);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Edit Type",
              style: TextStyle(color: white, fontSize: 20),
            ),
            content: TextFormField(
              controller: _editController,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                filled: true,
                fillColor: containerColor,
                hintText: 'Enter new type name',
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
                  // Update the type name
                  typeProvider.updateType(type, _editController.text);
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
                    'Medicine Type',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _typeController,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: containerColor,
                      hintText: 'Enter type name',
                      hintStyle: TextStyle(color: white.withOpacity(0.5)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final type = MedicineType(
                            id: '1', // Default ID
                            name: _typeController.text,
                          );
                          typeProvider.addType(type);
                          _typeController.clear();
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          _typeController.clear();
                        },
                        child: Text('Clear'),
                        style: ElevatedButton.styleFrom(
                          padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                      'Type List',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                              });
                            },
                            style: TextStyle(color: white),
                            decoration: InputDecoration(
                              hintText: 'Search type',
                              hintStyle:
                              TextStyle(color: white.withOpacity(0.5)),
                              filled: true,
                              fillColor: containerColor,
                              border: OutlineInputBorder(),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 12),
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
                            columnSpacing: 20,
                            columns: [
                              DataColumn(
                                  label: Text('ID',
                                      style: TextStyle(color: white))),
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(color: white))),
                              DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(color: white))),
                            ],
                            rows: filteredTypes.map((type) {
                              return DataRow(cells: [
                                DataCell(Text(type.id,
                                    style: TextStyle(color: white))),
                                DataCell(Text(type.name,
                                    style: TextStyle(color: white))),
                                DataCell(Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _showEditPrompt(type);
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
                                                "Are you sure you want to delete this type?",
                                                style: TextStyle(color: white),
                                              ),
                                              backgroundColor:
                                              scaffoldBackgroundColor,
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: white)),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    deleteType(type);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Colors.red
                                                              .withOpacity(0.7))),
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

