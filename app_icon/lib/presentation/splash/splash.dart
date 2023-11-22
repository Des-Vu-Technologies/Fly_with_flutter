import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  void startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goToNextpage);
  }

  void _goToNextpage() {
    Navigator.pushReplacementNamed(context, Routes.onBoarding);
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
      ),
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
