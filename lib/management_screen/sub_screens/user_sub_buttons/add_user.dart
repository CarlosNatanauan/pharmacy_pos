import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddUser extends StatefulWidget {
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  // For storing the selected image
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Add a container for image uploader
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: canvasColor,
                  ),
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () async {
                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image = image;
                      });
                    },
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
                          _image == null ? 'Tap to select image' : 'Tap to change image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: canvasColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Personal Information', style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: white),
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
                                  return 'Please enter a first name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Middle Name',
                                labelStyle: TextStyle(color: white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white.withOpacity(0.3)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              style: TextStyle(color: white),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: white),
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
                                  return 'Please enter a last name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: canvasColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('User Credentials', style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(color: white),
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
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white.withOpacity(0.3)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              obscureText: true,
                              style: TextStyle(color: white),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Role',
                                labelStyle: TextStyle(color: white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white.withOpacity(0.3)),
                                ),
                              ),
                              dropdownColor: accentCanvasColor,
                              style: TextStyle(color: white),
                              items: <String>['Cashier', 'Store Manager'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a role';
                                }
                                return null;
                              }, onChanged: (String? value) {  },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18), // Increase the font size
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Increase the padding
                    foregroundColor: white,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),


              ],
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
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);