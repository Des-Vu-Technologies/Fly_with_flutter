import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number = 42; // Introduce a variable to inspect
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Debug Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$number', // Display the variable value
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementCounter(number); // Call a function
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _incrementCounter(int num) {
    
    num++; // Modify the variable
    // ignore: avoid_print
    print('Incrementing: $num'); // Log the value
  }
}
