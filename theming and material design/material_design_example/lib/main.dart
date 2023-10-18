// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Material Design Example',
    theme: ThemeData(
      primarySwatch: Colors.green, // Set the primary color
      accentColor: Colors.orange, // Set the accent color    
    ),
    home: const MyHomePage(),
    
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white; // Initial background color

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.green; // Change the background color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press the button to change the background color:',
            ),
            Container(
              width: 200,
              height: 100,
              color: _backgroundColor, // Use the dynamic background color
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _changeBackgroundColor,
                child: const Text('Change Color'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(onPressed: (){},
      child: const Icon(Icons.add)), 
    );
  }
}
