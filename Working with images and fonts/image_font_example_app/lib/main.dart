import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              "Example App",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Mainfont",
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          body: const Center(
            child: Image(
              image: AssetImage("assets/images/images.jpeg"),
            ),
          ),
        ),
      ),
    );
  }
}
