import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = false;

  void _startLoading() async {
    setState(() {
      isLoading = true;
    });

    // Show the loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from closing it manually
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Simulate a delay (e.g., fetching data)
    await Future.delayed(Duration(seconds: 3));

    // Close the dialog and stop loading
    Navigator.pop(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loading Screen Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: _startLoading,
          child: Text("Start Loading"),
        ),
      ),
    );
  }
}
