import 'package:flutter/material.dart';
import 'custom_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widget Example'),
        ),
        body: Center(
          child: Column(
            children: [
              CustomButton(
                msg: 'Kali',
                onPressed: () {
                  // Your button's action here
                },
              ),
             const SizedBox(height: 10,),
              CustomButton(
                msg: 'siro',
                onPressed: () {
                  // Your button's action here
                },
              ),
              CustomButton(
                msg: 'dalli',
                onPressed: () {
                  // Your button's action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
