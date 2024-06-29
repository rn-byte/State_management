// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_st_mgmt/provider/count_provider.dart';
import 'package:provider_st_mgmt/provider/example_one_provider.dart';
import 'package:provider_st_mgmt/provider/favourite_provider.dart';
import 'package:provider_st_mgmt/provider/theme_changer_provider.dart';

import 'package:provider_st_mgmt/screen/favourite/fav_screen.dart';

import 'home_screen.dart';

import 'screen/count_example.dart';
import 'screen/favourite/dark_theme.dart';
import 'screen/favourite/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChangerProvider>(context);
    // for Multi provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeChangerProvider(),
        )
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                iconTheme: const IconThemeData(color: Colors.red),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.red)),
            home: ValueNotifyListenerScreen(),
          );
        },
      ),
    );
  }
}
