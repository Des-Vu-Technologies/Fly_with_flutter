import 'package:app_icon/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    onGenerateRoute: RouteGenerator.getRoutes,
    initialRoute: Routes.initial,
  ));
}
