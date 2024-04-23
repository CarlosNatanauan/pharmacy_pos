import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/pos_screen/main_pos_screen.dart';
import 'management_screen/main_man_screen.dart'; // Importing main_management_screen.dart

void main() {
  runApp(MyApp());

  // Initial window size
  doWhenWindowReady(() {
    const initialSize = Size(1200, 600);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize * 1.5; // Limit max size
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "My Flutter App";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), // Wrap with a Scaffold
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to main_pos_screen.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPosScreen()),
                );
              },
              child: Text('POS Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to main_management_screen.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainManagementScreen()),
                );
              },
              child: Text('Management Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
