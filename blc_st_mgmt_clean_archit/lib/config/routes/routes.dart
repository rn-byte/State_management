import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:blc_st_mgmt_clean_archit/views/views.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.loginhScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Routes Found'),
              ),
            );
          },
        );
    }
  }
}
