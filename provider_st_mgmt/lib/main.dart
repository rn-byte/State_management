import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_st_mgmt/provider/count_provider.dart';

import 'home_screen.dart';
import 'screen/count_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // for single provider
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountExample(),
      ),
    );
  }
}
