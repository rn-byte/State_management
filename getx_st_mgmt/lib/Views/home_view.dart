import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('This is GetX Tutorial'),
            ),
            Card(
              child: ListTile(
                title: const Text('This is GetX Dialog.'),
                subtitle: const Text('Click To Get Alert Dialog'),
                onTap: () => Get.defaultDialog(
                  title: 'Alert!',
                  titlePadding: const EdgeInsets.only(top: 20),
                  middleText: 'Are you sure you want to Delete?',
                  contentPadding: const EdgeInsets.all(20),
                  confirm: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                  cancel: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel')),
                  //content: ,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                  title: const Text('GetX BottomSheet'),
                  subtitle: const Text('GetX BottomSheet With Click'),
                  onTap: () {
                    Get.bottomSheet(SizedBox(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light_mode),
                            title: const Text('Light Mode'),
                            onTap: () {
                              themeController.changeThemeMode(ThemeMode.light);
                              //Get.changeThemeMode(ThemeMode.light);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.dark_mode),
                            title: const Text('Dark Mode'),
                            onTap: () {
                              themeController.changeThemeMode(ThemeMode.dark);
                              //Get.changeThemeMode(ThemeMode.dark);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.system_security_update),
                            title: const Text('System Mode'),
                            onTap: () {
                              Get.changeThemeMode(ThemeMode.system);
                            }, //
                          ),
                        ],
                      ),
                    ));
                  }),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const ScreenOne(),
                  //     ));

                  //Get.to(const ScreenOne());

                  //Routes
                  Get.toNamed('/ScreenOne');
                },
                title: const Text('GetX navigation Routes'),
                subtitle: const Text('Click here to goto next screen'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed('/LangTranslationScr');
                },
                title: const Text(
                    'Flutter GetX localization & Change App Language'),
                subtitle: const Text('Click Here to GoTo That screen'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed('CounterView');
                },
                title: const Text('Flutter GetX Counter Example'),
                subtitle: const Text('Click Here to GoTo That screen'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('Alert !!', 'This is GetX Test',
              backgroundColor: Colors.blue[200],
              snackPosition: SnackPosition.TOP,
              icon: const Icon(Icons.add),
              mainButton:
                  TextButton(onPressed: () {}, child: const Text('Click')));
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
