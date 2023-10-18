import 'package:flutter/material.dart';

import 'reusable widgets/dog_name.dart';
import 'reusable widgets/spacer.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // ignore: sized_box_for_whitespace
            DogName(name: "Kali",),
            Space(),
            DogName(name: "Sero",),
            Space(),
            DogName(name:"Dalli")
          ],
        ),
      ),
      //DRY pattern : Donot repeat yourself
    );
  }
}



