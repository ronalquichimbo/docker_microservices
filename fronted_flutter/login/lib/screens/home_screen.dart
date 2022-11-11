import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_before),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'mapa');
        },
      ),
    );
  }
}
