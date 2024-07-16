import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:blc_st_mgmt_clean_archit/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
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
