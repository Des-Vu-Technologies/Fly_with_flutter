import 'package:flutter/material.dart';

import 'screen/list_user_screen.dart';
import 'screen/single_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: SingleUserScreen());
  }
}
