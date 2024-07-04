import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_st_mgmt/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build 2');
    }
    //final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeChnager'),
        centerTitle: true,
        //backgroundColor: Colors.indigo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('Light Theme'),
                value: ThemeMode.light,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('Dark Theme'),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('System Theme'),
                value: ThemeMode.system,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          const Icon(Icons.favorite),
        ],
      ),
    );
  }
}
