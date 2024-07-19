import 'package:blc_st_mgmt_clean_archit/config/routes/routes.dart';
import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:blc_st_mgmt_clean_archit/repository/auth/login_http_api_repository.dart';
import 'package:blc_st_mgmt_clean_archit/repository/auth/login_mock_api_repository.dart';
import 'package:blc_st_mgmt_clean_archit/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginMockApiRepository());
}
