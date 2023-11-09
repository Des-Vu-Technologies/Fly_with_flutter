import 'package:flutter/material.dart';

import '../details/details_view.dart';
import '../home/home_view.dart';
import '../login/login_view.dart';
import '../signup/sign_up.dart';
import '../splash/splash.dart';

class Routes {
  static const String initial = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String details = '/details';
}

class RouteGenerator {
  static MaterialPageRoute getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LogInView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.details:
        return MaterialPageRoute(builder: (_) => const DetailsView());
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedRouteView());
    }
  }
}

class UndefinedRouteView extends StatelessWidget {
  const UndefinedRouteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Undefined Route")),
    );
  }
}
