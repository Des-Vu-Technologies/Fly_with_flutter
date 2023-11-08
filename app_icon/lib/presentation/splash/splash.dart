import 'package:flutter/material.dart';

import '../resources/route_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Splash screen"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: const Text("go to login screen"),
            ),
          ],
        ),
      ),
    );
  }
}
