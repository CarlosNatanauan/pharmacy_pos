import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/main_login.dart';
import 'management_screen/sub_screens/medicine_sub_buttons/provider/category_provider.dart';
import 'management_screen/sub_screens/medicine_sub_buttons/provider/type_provider.dart';
import 'management_screen/sub_screens/user_sub_buttons/model/user_provider.dart'; // Importing main_login.dart


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => MedicineTypeProvider()),// Add CategoryProvider here
        // Add more providers if needed
      ],
      child: MyApp(),
    ),
  );

  // Initial window size
  doWhenWindowReady(() {
    const initialSize = Size(1200, 600);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize * 1.5; // Limit max size
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "My Flutter App";
    appWindow.show();

    // Maximize the window after showing
    appWindow.maximize();
  });
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainLoginScreen(), // Using MainLoginScreen
    );
  }
}
