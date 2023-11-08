import 'package:flutter/material.dart';

import '../resources/route_manager.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Login screen"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.signup);
              },
              child: const Text("go to signup screen"),
            ),
          ],
        ),
      ),
    );
  }
}
