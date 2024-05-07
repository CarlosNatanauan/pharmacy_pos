import 'package:flutter/material.dart';
import '../login/globals.dart';

class MainPosScreen extends StatelessWidget {
  const MainPosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call the show method of WelcomeMessage to display it as a dialog
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      WelcomeMessage.show(context);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'This is the POS screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
