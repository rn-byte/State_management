import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/Views/counter_view.dart';
import 'package:getx_st_mgmt/Views/example_three.dart';
import 'package:getx_st_mgmt/Views/example_two.dart';
import 'package:getx_st_mgmt/Views/language_translation.dart';
import 'package:getx_st_mgmt/Views/screen_one.dart';
import 'package:getx_st_mgmt/Views/screen_two.dart';
import 'package:getx_st_mgmt/services/translations.dart';
import 'Views/fav_app_screen.dart';
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
      //Flutter GetX localization & Change App Language
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
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
      getPages: [
        GetPage(name: '/', page: () => const HomeView()),
        GetPage(name: '/ScreenOne', page: () => const ScreenOne()),
        GetPage(name: '/CounterView', page: () => const CounterView()),
        GetPage(name: '/ExampleTwo', page: () => const ExampleTwo()),
        GetPage(name: '/ExampleThree', page: () => const ExampleThree()),
        GetPage(name: '/FavAppScreen', page: () => const FavAppScreen()),
        GetPage(name: '/ScreenTwo', page: () => const ScreenTwo()),
        GetPage(
            name: '/LangTranslationScr',
            page: () => const LanguageTranslation()),
      ],
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
