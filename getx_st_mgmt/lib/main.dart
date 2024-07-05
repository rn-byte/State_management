import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void changeThemeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      isDarkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
