import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/color_manager.dart';
import '../resources/route_manager.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
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
