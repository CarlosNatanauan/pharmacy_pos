import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  // Initial window size
  doWhenWindowReady(() {
    const initialSize = Size(1300, 600);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize * 1.5; // Limit max size
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "My Flutter App";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            "Nucleio Information Services",
            style: TextStyle(fontSize: 30), // Make the text bigger
          ),
        ),
      ),
    );
  }
}
